//
//  UserPin.swift
//  myLand
//
//  Created by cybersoft on 31/01/2018.
//  Copyright © 2018 reklammakinasi. All rights reserved.
//

import Foundation
import MapKit

class UserPin : NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var id: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
       
    }
    


}
