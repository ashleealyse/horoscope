//
//  AppError.swift
//  Zodiacs
//
//  Created by Ashlee Krammer on 12/11/17.
//  Copyright © 2017 Ashlee Krammer. All rights reserved.
//

import Foundation

public enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case other(rawError: Error)
    case notAnImage
}
