//
//  MapView.swift
//  myLand
//
//  Created by cybersoft on 30/01/2018.
//  Copyright © 2018 reklammakinasi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import MapKitGoogleStyler

class MapView: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius : Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonB(_ sender: UIButton) {
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
        centerMapUserLocation()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    



}

extension MapView: MKMapViewDelegate {
    func centerMapUserLocation(){
        //Take coordinate from GPS location
        guard let coordinate = locationManager.location?.coordinate else {return}
        //Create a Region Object with coordinate and regionRadius
        //let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, regionRadius * 2.0, regionRadius * 2.0)
        //Set the map this region and shows up
        
        
        // 3D Camera
        let mapCamera = MKMapCamera()
        mapCamera.centerCoordinate = coordinate
        mapCamera.pitch = 45
        mapCamera.altitude = 500
        mapCamera.heading = 45
        
        mapView.camera = mapCamera
        
        //mapView.setRegion(coordinateRegion, animated: true)
    }
}

extension MapView: CLLocationManagerDelegate{
    //plist Authorization for user privacy
    func configureLocationServices() {
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        else{
            return
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        centerMapUserLocation()
    }
    
}
