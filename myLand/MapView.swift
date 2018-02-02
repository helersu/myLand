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

    @IBOutlet weak var annotationPanel: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadius : Double = 1000
    let detailLbl = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
        addImageAnnotation()
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
    
    private func configureTileOverlay(){
        
        guard let overlayFileURLString = Bundle.main.path(forResource: "overlay", ofType: "json") else {
            return
        }
        
        let overlayFileURL = URL(fileURLWithPath: overlayFileURLString)
        
        guard let tileOverlay = try? MapKitGoogleStyler.buildOverlay(with: overlayFileURL) else {
            return
        }
        
        mapView.add(tileOverlay)
        
    }
    
    func addImageAnnotation(){

        guard let coordinate = locationManager.location?.coordinate else {return}
        let myAnnotation = UserPin(coordinate: coordinate, title: "Baslik", subtitle: "altBaslik")

        mapView.addAnnotation(myAnnotation)
        
        
    }
    



}

extension MapView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let tileOverlay = overlay as? MKTileOverlay {
            return MKTileOverlayRenderer(tileOverlay: tileOverlay)
        }
        else{
            return MKOverlayRenderer(overlay: overlay)
        }
    }
    
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
        configureTileOverlay()
        
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        else {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named: "testicon")
            //detailLbl.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
            //detailLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            //detailLbl.text = ""
            //annotationPanel.addSubview(detailLbl)
            
            

            //annotationView.addSubview(annotationPanel)
            
            
            //add pathbutton for all annotation
           let pathButton = PathButton(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
            annotationView.addSubview(pathButton)
            
                
                
        
            
            return annotationView
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
     
   
    // Do something selected Annatation
      
       
        
        
        //UIView.animate(withDuration: 0.3) {
           
            //pathButton.alpha = 1
            //if pathButton.alpha != pathButton.alpha{
            //    pathButton.alpha = 1
            //}
            //else{
            //     pathButton.alpha = 0
            //}
           
        //}
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        
        // do something annotation deselect
    }
    
    

    
}
