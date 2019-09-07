//
//  ListCellViewModel.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit

struct ListCellViewModel {
    let applicantTitle: String?
    let locationTitle: String?
    let optionaltextTitle: String?
    let starttimeTitle: String?
    let endtimeTitle: String?
    
    init(applicantTitle: String?, locationTitle: String?, optionaltextTitle: String?, starttime: String?, endtime: String?) {
        self.applicantTitle = applicantTitle
        self.locationTitle = locationTitle
        self.optionaltextTitle = optionaltextTitle
        self.starttimeTitle = starttime
        self.endtimeTitle = endtime
    }
}
