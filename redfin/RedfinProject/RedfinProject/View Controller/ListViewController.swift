//
//  ListViewController.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    required init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installTableView()
        installViewConstraints()
    }
    
    private func installTableView() {
        view.addSubview(listTableView)
        
        listTableView.dataSource = self
        listTableView.estimatedRowHeight = 66
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.backgroundColor = UIColor.clear
        listTableView.separatorStyle = .singleLine
        listTableView.separatorColor = UIColor.black
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: listTableViewCellIdentifier)
    }

    private func installViewConstraints() {
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private let listTableView: UITableView = {
        let listTableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        return listTableView
    }()
    
    private let viewModel: ListViewModel
    private let listTableViewCellIdentifier = "listTableViewCell"
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: listTableViewCellIdentifier, for: indexPath) as! ListTableViewCell        
        cell.viewModel = self.viewModel.listItems?[indexPath.row]
        return cell
    }

}

extension ListViewController: ListViewUpdateProtocol {
    func listViewUpdate() {
        DispatchQueue.main.async {
            self.listTableView.reloadData()
        }
    }
}


