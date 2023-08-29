//
//  MapView.swift
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    
    let latitude: Double
    let longitude: Double
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        // Remove existing annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Create a map pin for the specified coordinate
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        
        // Add the annotation to the map
        uiView.addAnnotation(annotation)
        
        // Set the region to display the pin
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        uiView.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
    }
}

