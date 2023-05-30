//
//  GetLocation.swift
//  WeatherApp
//
//  Created by Şeyda Şeyma Balcı on 30.05.2023.
//

import Foundation
import CoreLocation

class LocationManager:NSObject,ObservableObject,CLLocationManagerDelegate{
    
    let manager=CLLocationManager()  //instancelarda parantez kullanmak zorundasın
    
    @Published var location : CLLocationCoordinate2D?  // optional olması user bize konum vermeyi reddederse diye
    @Published var isLoading = false
    
 
    override init(){
        super.init()
        manager.delegate=self
    }
    
    func requestLocation(){
        isLoading=true
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location=locations.first?.coordinate
        isLoading=false // location found
    }
    //handle error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("We managed an error while getting location", error)
        isLoading=false
    }
}
