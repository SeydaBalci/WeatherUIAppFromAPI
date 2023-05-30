//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Şeyda Şeyma Balcı on 30.05.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {

        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .font(.headline).fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                //elements will be shown under
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud.fill")
                                .font(.system(size: 50))
                            
                            //weather array
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 100, alignment: .leading)
                        
                        
                    Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°C")
                            .font(.system(size: 60))
                            .fontWeight(.semibold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 570)
                }
                .frame(maxWidth: .infinity)
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20 ){
                    Text("Hava Durumu")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherInfoBlock(logo: "thermometer.sun.fill", name: "Hissedilen en düşük sıcaklık", value: weather.main.tempMin.roundDouble() + "°C")
                            .foregroundColor(.black)
                    }
                    HStack{
                        WeatherInfoBlock(logo: "thermometer.sun.fill", name: "Hissedilen en yüksek sıcaklık", value: weather.main.tempMax.roundDouble() + "°C")
                            .foregroundColor(.black)
                    }
                    HStack{
                        WeatherInfoBlock(logo: "wind", name: "Rüzgar Hızı", value: weather.wind.speed.roundDouble() + " m/s")
                            .foregroundColor(.black)
                    }
                    HStack{
                        WeatherInfoBlock(logo: "humidity", name: "Nem Oranı", value: "%" + weather.main.humidity.roundDouble() )
                            .foregroundColor(.black)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.blue)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        
        .edgesIgnoringSafeArea(.bottom)
        .background(.blue)
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: showWeather)
    }
}
