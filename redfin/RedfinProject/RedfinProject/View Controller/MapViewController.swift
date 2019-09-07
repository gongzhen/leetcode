//
//  MapViewController.swift
//  RedfinProject
//
//  Created by Zhen Gong on 9/1/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController {

    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installMapView()
    }
    
    private func installMapView() {
        view.addSubview(mapView)
        view.addSubview(foodTruckInfoView)
        
        mapView.delegate = self
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        foodTruckInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: foodTruckInfoView.topAnchor).isActive = true
        
        foodTruckInfoView.topAnchor.constraint(equalTo: mapView.bottomAnchor).isActive = true
        foodTruckInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        foodTruckInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        foodTruckInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.isRotateEnabled = true
        let defaultMapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let defaultRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297), span: defaultMapSpan)
        mapView.setRegion(defaultRegion, animated: false)
        return mapView
    }()
    
    private var foodTruckInfoView: FoodTruckInfoView = {
        let titleView = FoodTruckInfoView()
        return titleView
    }()
    
    private let viewModel: MapViewModel
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapAnnotationViewModel else { return nil }
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            return dequeuedView
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? MapAnnotationViewModel else {
            return
        }
        foodTruckInfoView.viewModel = annotation
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        foodTruckInfoView.viewModel = nil
    }
}

extension MapViewController: MapViewUpdateProtocol {
    func mapViewUpdate() {
        if let listItems = viewModel.listItems {
            DispatchQueue.main.async { [weak self] in
                if let annotations = self?.mapView.annotations, annotations.count > 0 {
                    self?.mapView.removeAnnotations(annotations)
                }
                self?.mapView.addAnnotations(listItems)
                self?.mapView.showAnnotations(listItems, animated: true)
            }
        }
    }
}
