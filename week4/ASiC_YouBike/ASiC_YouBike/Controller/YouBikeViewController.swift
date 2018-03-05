//
//  YouBikeViewController.swift
//  ASiC_YouBike
//
//  Created by WU CHIH WEI on 2018/2/25.
//  Copyright © 2018年 WU CHIH WEI. All rights reserved.
//

import UIKit
import MapKit

protocol StationInfo {
    
    var name: String { get }
    
    var position: String { get }
    
    var remainBikes: String { get }
}

class YouBikeViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var remainBikesLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    let closureClient = ClosureClient()
    
    var delegateClient = DelegateClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        if let annotations = closureClient.getDataFromFile() {
            mapView.showAnnotations(annotations, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if let stations = delegateClient.loadData() {
            for station in stations {
                if station.name == (view.annotation?.title)! {
                    titleLabel.text       = station.name
                    positionLabel.text    = station.position
                    remainBikesLabel.text = "剩 \(station.remainBikes) 台"
                    break
                }
            }
        }
    }
}
