//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by abhishek.karkar on 05/04/23.
//

import Foundation

protocol WebService {
    func ApiCall<T: Decodable>(
        path: String,
        param: [String:Any],
        completionHandler: @escaping (Result<T, Error>) -> Void
    )
}
