//
//  HoroscopeAPIClient.swift
//  Zodiacs
//
//  Created by Ashlee Krammer on 12/11/17.
//  Copyright © 2017 Ashlee Krammer. All rights reserved.
//

import Foundation

class HoroscopeAPIClient {
    private init() {}
    static let manager = HoroscopeAPIClient()
    func getHoroscope(from url: String, completionHandler: @escaping (Horoscope) -> Void, errorHandler: @escaping (Error) -> Void) {
        
        
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let horoscope = try JSONDecoder().decode(Horoscope.self, from: data)
                completionHandler(horoscope)
            }
            catch{
                errorHandler(error)
            }
            
        }
        
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errorHandler)
   
    }
}
