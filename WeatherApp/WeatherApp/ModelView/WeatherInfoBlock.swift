//
//  WeatherInfoBlock.swift
//  WeatherApp
//
//  Created by Şeyda Şeyma Balcı on 30.05.2023.
//

import SwiftUI

struct WeatherInfoBlock: View {
    var logo:String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: logo)
                .font(.title)
                .frame(width: 20,height: 20)
                .padding()
                .background(.white)
                .cornerRadius(30)
            
            
            VStack(alignment: .leading, spacing: 10){
                Text(name)
                    .font(.headline)
                
                Text(value)
                    .bold()
                    .font(.largeTitle)
            }
        }
    }
}

struct WeatherInfoBlock_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoBlock(logo: "thermometer.sun.fill", name: "Hissedilen", value: "18.8°C")
    }
}
