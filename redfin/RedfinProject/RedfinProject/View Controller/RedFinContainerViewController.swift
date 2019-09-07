//
//  RedFinContainerViewController.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import UIKit

class RedFinContainerViewController: UIViewController {

    required init() {
        isListView = true
        listViewModel = ListViewModel()
        mapViewModel = MapViewModel()
        listViewController = ListViewController(viewModel: listViewModel)
        listViewModel.delegate = listViewController
        mapViewController = MapViewController(viewModel: mapViewModel)
        mapViewModel.delegate = mapViewController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Food Trucks"
        view.backgroundColor = UIColor.white
        
        installNavigationItem()
        initContainerSubView()
    }
    
    private func initContainerSubView() {
        listViewModel.getFoodTruckInfoRequest()
        
        addChild(listViewController)
        addChild(mapViewController)
        view.addSubview(mapViewController.view)
        view.insertSubview(listViewController.view, aboveSubview: mapViewController.view)
        listViewController.didMove(toParent: self)
        mapViewController.view.alpha = 0.0
        
        installListViewControllerConstraint()
        installMapViewControllerConstraint()
    }
    
    private func installListViewControllerConstraint() {
        listViewController.view.translatesAutoresizingMaskIntoConstraints = false
        listViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        listViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        listViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        listViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func installMapViewControllerConstraint() {
        mapViewController.view.translatesAutoresizingMaskIntoConstraints = false
        mapViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mapViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func installNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(viewTransitionButtonTapped))
    }
    
    @objc private func viewTransitionButtonTapped() {
        if isListView == true {
            mapViewModel.getFoodTruckInfoRequest()
            UIView.animate(withDuration: 0.35,
                           delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                            self.listViewController.view.alpha = 0.0
                            self.mapViewController.view.alpha = 1.0
                            self.isListView = false
                            self.navigationItem.rightBarButtonItem?.title = "List"
                            self.mapViewController.view.layoutIfNeeded()
            })
        } else {
            listViewModel.getFoodTruckInfoRequest()
            UIView.animate(withDuration: 0.35,
                           delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
                            self.isListView = true
                            self.listViewController.view.alpha = 1.0
                            self.mapViewController.view.alpha = 0.0
                            self.navigationItem.rightBarButtonItem?.title = "Map"
                            self.listViewController.view.layoutIfNeeded()
            })
        }
    }

    private var isListView: Bool
    private let listViewModel: ListViewModel
    private let mapViewModel: MapViewModel
    private let listViewController: ListViewController
    private let mapViewController: MapViewController
}
