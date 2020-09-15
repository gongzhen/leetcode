//
//  ViewController.swift
//  GCD-FB-InterviewProject
//
//  Created by Zhen Gong on 9/8/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//  http://danielemargutti.com/2017/10/19/throttle-in-swift/
//  https://www.swiftbysundell.com/articles/a-deep-dive-into-grand-central-dispatch-in-swift/

import UIKit

class ViewController: UIViewController {
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    lazy var tableView = UITableView(frame: CGRect.zero, style: .plain)
    private var items:[Repository]?
    private var workItem: DispatchWorkItem?
    private var time1: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 66).isActive = true
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let items = items else {
            return cell
        }
        cell.textLabel?.text = items[indexPath.row].repoName
        return cell
    }

}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let previousTime = time1
        print(searchText)
        time1 = Date().timeIntervalSince1970
        let timeinterval = time1 - previousTime
        print(timeinterval)
        
        workItem?.cancel()
        
        let requestWorkItem = DispatchWorkItem { [weak self] in
            print("searchText:\(searchText)")
            APIManager.shared.repositoriesBy(searchText) { (items, error) in
                if error == nil, let items = items {
                    self?.items = items
                } else {
                    self?.items = nil
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        workItem = requestWorkItem
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(10), execute: requestWorkItem)
    }
}

struct Repository {
    let repoName: String
    let repoURL: String
}

@objc class APIManager: NSObject {
    @objc static let shared = APIManager()
    
    private override init() {
    }
    
    private func replaceEmptySpace(_ query: String) -> String? {
        let urlQuery = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        return urlQuery
    }
    
    public func repositoriesBy(_ githubID: String, completion: @escaping ((_ listItems: [Repository]?, _ error: NSError?) -> Void)) {
        guard let urlString = replaceEmptySpace(githubID), let url = URL(string: "https://api.github.com/users/\(urlString)/repos") else {
            completion(nil, nil)
            return
        }
        let request = URLRequest(url: url);
        dataTask = URLSession(configuration: .default).dataTask(with: request, completionHandler: { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil, nil)
                return
            }
            let itemLists = try? JSONSerialization.jsonObject(with: data, options: [])
            if let itemLists = itemLists as? [AnyObject] {
                let repos = itemLists.map({ item -> Repository? in
                    guard let repoName = item["name"] as? String,
                        let repoURL = item["html_url"] as? String else {
                            return nil
                    }
                    return Repository(repoName: repoName, repoURL: repoURL)
                }).filter({ item -> Bool in
                    return item != nil
                }) as? [Repository]
                if let repos = repos {
                    print("result count \(repos.count)")
                }
                completion(repos, nil)
            } else {
                if let data = itemLists {
                    print(data)
                }
                completion(nil, nil)
            }
        })
        dataTask?.resume()
    }
    
    private var dataTask: URLSessionDataTask?
}
