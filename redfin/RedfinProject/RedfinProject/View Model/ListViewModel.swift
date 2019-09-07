//
//  ListViewModel.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit

protocol ListViewUpdateProtocol: class {
    func listViewUpdate()
}

class ListViewModel: NSObject {
    
    var listItems: [ListCellViewModel]?    
    weak var delegate: ListViewUpdateProtocol?

    override init() {
        super.init()        
    }
    
    func numberOfItems() -> Int {
        return listItems?.count ?? 0
    }
    
    func getFoodTruckInfoRequest() {        
        SFFoodTruckAPIManager.shared.getFoodTruckInfoRequest { [weak self] (listItems, error) in
            if error == nil, let listItems = listItems {
                self?.listItems = listItems.map({ listItem in
                    return ListCellViewModel(applicantTitle: listItem.applicant, locationTitle: listItem.location, optionaltextTitle: listItem.optionaltext, starttime: listItem.starttime, endtime: listItem.endtime)
                })
                self?.delegate?.listViewUpdate()
            }
        }
    }
}
