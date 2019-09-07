//
//  FoodTruckInfoView.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit

class FoodTruckInfoView: UIView {
    
    required init() {
        super.init(frame: .zero)
    
        installConstraints()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: MapAnnotationViewModel? {
        didSet {
            if let viewModel = viewModel {
                applicantLabel.text = viewModel.applicantTitle
                locationLabel.text = viewModel.locationTitle
                optionaltextLabel.text = viewModel.optionaltextTitle
                if let startTime = viewModel.starttimeTitle, let entTime = viewModel.endtimeTitle {
                    timeLabel.text = startTime + "-" + entTime
                } else {
                    timeLabel.text = "N/A"
                }
            } else {
                applicantLabel.text = nil
                locationLabel.text = nil
                optionaltextLabel.text = nil
                timeLabel.text = nil
            }
        }
    }
    
    private func installConstraints() {
        addSubview(applicantLabel)
        addSubview(locationLabel)
        addSubview(optionaltextLabel)
        addSubview(timeLabel)
        
        applicantLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        optionaltextLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false

        /// left side labels.
        applicantLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        applicantLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        applicantLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
        applicantLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor).isActive = true

        locationLabel.topAnchor.constraint(equalTo: applicantLabel.bottomAnchor).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: optionaltextLabel.topAnchor).isActive = true

        optionaltextLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor).isActive = true
        optionaltextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        optionaltextLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
        optionaltextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        /// right side labels
        timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: optionaltextLabel.trailingAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        timeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 128).isActive = true
    }

    private let applicantLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    private let locationLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    private let optionaltextLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    private let timeLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = NSTextAlignment.center
        return titleLabel
    }()
}
