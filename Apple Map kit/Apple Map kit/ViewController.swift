//
//  ViewController.swift
//  Apple Map kit
//
//  Created by Apple on 03/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate{
    
    
    @IBOutlet weak var destinationTextFiled: UITextField!
    @IBOutlet weak var seacrchButton: UIButton!
    @IBOutlet weak var seachTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    
    func showRegion(){
        let location = CLLocationCoordinate2D(latitude: 28.606055,
                                              longitude: 77.361897)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
       mapView.showsUserLocation = true
        
        
       showRegion()


    }
    
    
    
    @IBAction func directionTapped(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            self.destinationTextFiled.isHidden = false
            self.seachTextField.placeholder = "Enter Source"
        }
       
        
    }
    
    
    @IBAction func gpsButtonTapped(_ sender: Any) {
        
        
        startReceivingLocationChanges()
        
        
    }
    
    
    func startReceivingLocationChanges() {
        locationManager.requestWhenInUseAuthorization()
        let authorizationStatus = CLLocationManager.authorizationStatus()
        print(CLLocationManager.authorizationStatus().rawValue)
        
        switch authorizationStatus {
            
        case .authorizedAlways:
            print("restricted")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            print(locationManager.location?.coordinate.latitude)
            
            let location = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!,
                                                  longitude: (locationManager.location?.coordinate.latitude)!)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
            
            
            
        case .denied:
            print("denied")
        case .restricted:
            print("restricted")
        case .notDetermined:
            print("notDetermined")
        @unknown default:
            fatalError()
        }
        
        // Do not start services that aren't available.
        if !CLLocationManager.locationServicesEnabled() {
            // Location services is not available.
            print("gps not available")
            return
        }
    }
    
    
    
    @IBAction func searchTapped(_ sender: UIButton) {
        
       
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = seachTextField.text
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start { (response, error) in
            
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error").")
                
                return
            }
            
            for item in response.mapItems{
//                item.openInMaps()
                self.mapView.centerCoordinate = item.placemark.coordinate
                
                
                let location = CLLocationCoordinate2D(latitude: item.placemark.coordinate.latitude,
                                                      longitude: item.placemark.coordinate.longitude)
                let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                let region = MKCoordinateRegion(center: location, span: span)
                self.mapView.setRegion(region, animated: true)
                
//                self.mapView.mapType = .satellite
                let name = MKPointAnnotation()
                name.coordinate = item.placemark.coordinate
//                print(item.name)
                self.mapView.addAnnotation(name)
                let marker = MKMarkerAnnotationView()
                marker.glyphText = "gyhy7hjy"
                name.accessibilityValue = item.placemark.title
                
            }
            
        }
        
       
        
    }
    
}


extension ViewController{
    
    
    func findRoute(source sourceName:String,destination destinationName:String){
        
    }
    
    
}
