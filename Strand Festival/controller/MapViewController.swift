//
//  MapViewController.swift
//  Strand Festival
//
//  Created by AMINE on 2/5/19.
//  Copyright © 2019 be.ehb. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
 
    let Annotations = MyAnnotations()
        let initialCoordinate = CLLocationCoordinate2DMake(51.150136,2.7183747)
        
    
    @IBOutlet weak var mapKitView: MKMapView!
    

    
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    var annotationView = MKMarkerAnnotationView()
    guard let annotation = annotation as? myAnnotation else {return nil}
    var identifier = ""
    var color = UIColor.red
    switch annotation.type{
    case .deepDish:
        identifier = "deepDish"
        color = .red
    case .potPie:
        identifier = "potPie"
        color = .black
    case .thin:
        identifier = "thin"
        color = .blue
    }
    if let dequedView = mapView.dequeueReusableAnnotationView(
        withIdentifier: identifier)
        as? MKMarkerAnnotationView {
        annotationView = dequedView
    } else{
        annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
    }
    annotationView.markerTintColor = color
    annotationView.glyphImage = UIImage(named: "Strand Festival dag1")
    annotationView.glyphTintColor = .yellow
    annotationView.clusteringIdentifier = identifier
    return annotationView
}


override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    //set intial region
    let initialregion = MKCoordinateRegion(center: initialCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
    mapKitView.setRegion(initialregion, animated: true)
    // add the annotations
    mapKitView.addAnnotations(Annotations.pinnekes)
}
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
   
    @IBAction func kaartWeergaveGekozen(_ sender: UISegmentedControl) {
    
    
    
    let gekozen = sender.selectedSegmentIndex
    
    switch gekozen {
    case 0: mapKitView.mapType = .satellite
    //extra voor Jara, kleur aanpassen in code
    //sender.tintColor = UIColor.red
    case 1: mapKitView.mapType = .standard
    case 2: mapKitView.mapType = .hybrid
    default:mapKitView.mapType = .standard    }
    }
}


enum PinType {
    case thin
    case deepDish
    case potPie
}

class myAnnotation:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: PinType
    init(_ latitude:CLLocationDegrees,_ longitude:CLLocationDegrees,title:String,subtitle:String,type:PinType){
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}


class MyAnnotations: NSObject {
    var pinnekes:[myAnnotation]
    
    override init(){
        //build an array of pizza loactions literally
pinnekes = [myAnnotation( 51.150136,2.7183747, title: "Podium Festival", subtitle:"Strand Festival", type: .potPie)]
pinnekes += [myAnnotation(51.1483361,2.7119015 ,title: "Pizzeria Due", subtitle:"Restaurant", type: .deepDish)]
pinnekes += [myAnnotation(51.1483361,2.7119015, title: "Gino's East", subtitle:"Restaurant", type: .deepDish)]
pinnekes += [myAnnotation(51.150308,2.7184568, title: " Pizza and Oven Grinder", subtitle:"Restaurant", type:.deepDish )]
pinnekes += [myAnnotation(51.1476712,2.7120856, title: "Pequods", subtitle:"Restaurant", type: .deepDish)]
pinnekes += [myAnnotation(51.150136,2.7183760, title: "W.C1", subtitle:"Openbaar", type: .thin)]
pinnekes += [myAnnotation(51.150100,2.7183200, title: "W.C2", subtitle:"Privé", type: .thin)]
pinnekes += [myAnnotation(51.150432,2.7278945, title: "W.C3", subtitle:"Betaalbaar", type: .thin)]
pinnekes += [myAnnotation(51.150445,2.7278932, title: "W.C4", subtitle:"Openbaar", type: .thin)]
    }
    


}

/*override func viewDidLoad() {
    super.viewDidLoad()
    
    mapKitView.delegate = self
    mapKitView.showsScale = true
    mapKitView.showsPointsOfInterest = true
    mapKitView.showsUserLocation = true
    
    
    
    locationManager.requestAlwaysAuthorization()
    locationManager.requestWhenInUseAuthorization()
    
    
    if CLLocationManager.locationServicesEnabled(){
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.startUpdatingLocation()
    }
    
    let sourceCoordinates = locationManager.location?.coordinate
    let destinatioCoordinates = CLLocationCoordinate2DMake51.150136,2.7183747
    
    let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinates!)
    let destnationPlacemark = MKPlacemark(coordinate: destinatioCoordinates)
    
    let sourceItem = MKMapItem(placemark: sourcePlacemark)
    let destItem = MKMapItem(placemark: destnationPlacemark)
    
        let directionRequest = MKDirections.Request()
    
    directionRequest.source = sourceItem
    directionRequest.destination = destItem
    directionRequest.transportType = .automobile
    
    let directions = MKDirections(request: directionRequest)
    directions.calculate(completionHandler: {
    response, error in
    
    
    guard let response = response else{
    
    
    if error != nil{
    print(error!)
    }
    
    return
    }
    
    
    let route = response.routes[0]
        self.mapKitView.addOverlay(route.polyline, level: .aboveRoads)
    
    let rekt = route.polyline.boundingMapRect
        self.mapKitView.setRegion(MKCoordinateRegion(rekt ), animated: true)
    })
    
    
*/


