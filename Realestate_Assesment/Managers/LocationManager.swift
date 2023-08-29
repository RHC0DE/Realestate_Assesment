//
//  Realestate_Assesment
//

import Foundation
import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?
    @Published var longitude: Double = 0.0
    @Published var latitude: Double = 0.0
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
        } else {
            print("ERROR: The location services might not be enabled!")
        }
    }
    
    private func convertToKilometers(latitude: Double, longitude: Double) -> CLLocationDistance? {
        guard let userLocation = locationManager.location else { return nil}
        
        let adressLocation = CLLocation(latitude: latitude, longitude: longitude)
        let distanceInMeters = userLocation.distance(from: adressLocation)
        let distanceInKilometers = distanceInMeters / 1000
        
        return distanceInKilometers
        
    }
    
    
    func convertToKilometersFromUserLocation(latitude: Double, longitude: Double) -> CLLocationDistance? {
        guard let userLocation = locationManager.location else { return nil }
        
        let adressLocation = CLLocation(latitude: latitude, longitude: longitude)
        let distanceInMeters = userLocation.distance(from: adressLocation)
        let distanceInKilometers = distanceInMeters / 1000
        
        return distanceInKilometers
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        longitude = location.coordinate.longitude
        latitude = location.coordinate.latitude
    }
}
