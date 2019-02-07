//
//  MyAnnotation.swift
//  Strand Festival
//
//  Created by AMINE on 2/5/19.
//  Copyright © 2019 be.ehb. All rights reserved.
//

import Foundation

import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    
    //verplicht toevoegen, anders geen annotatie
    var coordinate: CLLocationCoordinate2D
    //optioneel, eerder voor pop up bij pinnekes
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title:String, subtitle:String) {
        self.coordinate = coordinate
     
        self.title = title
        self.subtitle = subtitle
    }
}
