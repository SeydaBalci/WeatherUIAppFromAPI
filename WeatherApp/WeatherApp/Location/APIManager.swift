//
//  APIManager.swift
//  WeatherApp
//
//  Created by Şeyda Şeyma Balcı on 30.05.2023.
//

import Foundation
import CoreLocation

class APIManagaer{
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody//async await method wwdc21
    {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("xxx")&units=metric") else { fatalError("url bulunamadı")   }
        let urlRequest = URLRequest(url: url)
        let (data, response)=try await URLSession.shared.data(for: urlRequest)//bunu ne için yapıyoruz??
        
        guard (response as? HTTPURLResponse)?.statusCode==200 else { fatalError("data fetch error")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}
    
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct ResponseBody: Decodable {
        var main: MainResponse
        var coord: CoordinatesResponse
        var weather: [WeatherResponse]
        var wind: WindResponse
        var name: String
        
        struct MainResponse: Decodable {
            var temp: Double
            var feels_like: Double
            var temp_min: Double
            var temp_max: Double
            var pressure: Double
            var humidity: Double
        }
        
        struct WindResponse: Decodable {
            var speed: Double
            var deg: Double
        }
    }
    extension ResponseBody.MainResponse {
        var feelsLike: Double { return feels_like }
        var tempMin: Double { return temp_min }
        var tempMax: Double { return temp_max }
    }
    

