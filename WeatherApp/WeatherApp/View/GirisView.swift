//
//  GirisView.swift
//  WeatherApp
//
//  Created by Şeyda Şeyma Balcı on 30.05.2023.
//

import SwiftUI
import CoreLocationUI

struct GirisView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {

        VStack{
            VStack(spacing: 20){
                Text("WeatherApp")
                    .bold().font(.title).foregroundColor(.black)
                Text("hava durumu bilgilerini almak için konum paylaşmanız gerekmektedir")
                    .foregroundColor(.black)
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareMyCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .foregroundColor(.white)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GirisView_Previews: PreviewProvider {
    static var previews: some View {
        GirisView()
    }
}
