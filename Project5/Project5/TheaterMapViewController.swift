//
//  TheaterMapViewController.swift
//  Project5
//
//  Created by 유호준 on 2021/08/11.
//


import UIKit
import MapKit

class TheaterMapViewController: UIViewController{
    @IBOutlet var map: MKMapView!
  
    
    var param : NSDictionary!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        let lat = (self.param?["위도"] as! NSString).doubleValue
        let lng = (self.param?["경도"] as! NSString).doubleValue
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let regionRadius: CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        
        self.map.addAnnotation(point)
        self.map.setRegion(coordinateRegion, animated: true)
        
    }
    
}
