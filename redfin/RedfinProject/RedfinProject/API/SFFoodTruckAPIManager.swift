//
//  SFFoodTruckAPIManager.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit

class SFFoodTruckAPIManager: NSObject {
    
    static let shared = SFFoodTruckAPIManager()
    
    func getFoodTruckInfoRequest(completion: @escaping ((_ listItems: [ListItem]?, _ error: NSError?) -> Void)) {
        dataTask?.cancel()
        guard let url = addURLQueryParameters(urlString: baseURL) else {
            return
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("6bWhNQP2fYWJ1kLIVXXHpuPwb", forHTTPHeaderField: "X-App-Token")
        dataTask = URLSession(configuration: .default).dataTask(with: request) { [weak self] (data, response, error) in
            defer {
                self?.dataTask = nil
            }
            guard error == nil else {
                completion(nil, error as NSError?)
                return
            }
            guard let data = data else {
                completion(nil, nil)
                return
            }
            let itemLists = try? JSONDecoder().decode([ListItem].self, from: data)
            if let itemLists = itemLists?.sorted(by: { (item1, item2) -> Bool in
                if let applicant1 = item1.applicant, let applicant2 = item2.applicant {
                    return applicant1 < applicant2
                } else if let _ = item1.applicant {
                    return true
                }
                return false
            }) {
                // print(itemLists)
                completion(itemLists, nil)
            }
        }
        dataTask?.resume()
    }
    
    private func addURLQueryParameters(urlString: String) -> URL? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        var queryItems = [URLQueryItem]()
        
        formatter.dateFormat = "EEEE" // Monday
        let dayofweekstr = formatter.string(from: Date())
        queryItems.append(URLQueryItem(name: "dayofweekstr", value: dayofweekstr))
        
        formatter.dateFormat = "ha" // 9
        let hourString = formatter.string(from: Date())
        queryItems.append(URLQueryItem(name: "starttime", value: hourString))
        
        //  https://soda.demo.socrata.com/resource/4tka-6guv.json?$where= > 3.0
        // https://data.sfgov.org/resource/jjew-r69b.json?$where=end24 > 21
        urlComponents.queryItems = queryItems
        
        guard let apiURL = urlComponents.url else {
            return URL(string: baseURL)
        }
        return apiURL
    }
    
    private var dataTask: URLSessionDataTask?
    private let baseURL = "https://data.sfgov.org/resource/jjew-r69b.json?$limit=200"
    private let formatter = DateFormatter()
}
