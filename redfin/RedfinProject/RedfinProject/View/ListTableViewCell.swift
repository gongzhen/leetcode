//
//  ListTableViewCell.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    // MARK: - Init Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        installConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        applicantLabel.text = nil
        locationLabel.text = nil
        optionaltextLabel.text = nil
        timeLabel.text = nil
    }
    
    var viewModel: ListCellViewModel? {
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
        contentView.addSubview(applicantLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(optionaltextLabel)
        contentView.addSubview(timeLabel)
        
        applicantLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        optionaltextLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        /// left side labels.
        applicantLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        applicantLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        applicantLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
        applicantLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor).isActive = true
        
        locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: optionaltextLabel.topAnchor).isActive = true
        
        optionaltextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        optionaltextLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
        optionaltextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        /// right side labels
        timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: applicantLabel.trailingAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.size.width / 3.0).isActive = true
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
