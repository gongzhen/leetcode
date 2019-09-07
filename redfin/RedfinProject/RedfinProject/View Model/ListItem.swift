//
//  ListItem.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit

struct ListItem: Decodable {
    let starttime: String?
    let endtime: String?
    let location: String?
    let optionaltext: String?
    let locationid: String?
    let applicant: String?
    let latitude: String?
    let longitude: String?
}
