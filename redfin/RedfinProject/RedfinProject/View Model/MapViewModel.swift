//
//  MapViewModel.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewUpdateProtocol: class {
    func mapViewUpdate()
}

class MapViewModel: NSObject {
    
    var listItems: [MapAnnotationViewModel]?
    weak var delegate: MapViewUpdateProtocol?
    
    override init() {
        super.init()
    }
    
    func getFoodTruckInfoRequest() {
        SFFoodTruckAPIManager.shared.getFoodTruckInfoRequest { [weak self] (listItems, error) in
            if error == nil, let listItems = listItems {
                self?.listItems = listItems.map({ listItem in
                    if let latitudeStr = listItem.latitude, let longitudeStr = listItem.longitude {
                        if let latitude = Double(latitudeStr), let longitude = Double(longitudeStr) {
                            return MapAnnotationViewModel(applicantTitle: listItem.applicant, locationTitle: listItem.location, optionaltextTitle: listItem.optionaltext, starttime: listItem.starttime, endtime: listItem.endtime, coordinate:CLLocationCoordinate2D(latitude: Double(latitude), longitude: Double(longitude)))
                        }
                    }
                    return MapAnnotationViewModel(applicantTitle: listItem.applicant, locationTitle: listItem.location, optionaltextTitle: listItem.optionaltext, starttime: listItem.starttime, endtime: listItem.endtime, coordinate:CLLocationCoordinate2D())

                })
                self?.delegate?.mapViewUpdate()
            }
        }
    }
}
