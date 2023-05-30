//
//  ContentView.swift
//  WeatherApp
//
//  Created by Şeyda Şeyma Balcı on 24.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager() //initializing //stateobject sayesinde published variable her update olduğunda  wrap olmasını sağlıyor
    
    var APIManager = APIManagaer()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
                //koordinasyon göstermek için
            if let location = locationManager.location{
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                Text("Bulunduğunuz konum: \(location.latitude), \(location.longitude)")
                     } else{
                    if locationManager.isLoading{
                        LoadingView()
                    } else{
                        GirisView()
                            .environmentObject(locationManager)
                        Image(systemName: "cloud")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
            }
        .background(.white)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
