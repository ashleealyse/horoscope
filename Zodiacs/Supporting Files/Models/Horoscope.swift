//
//  Horoscope.swift
//  Zodiacs
//
//  Created by Ashlee Krammer on 12/11/17.
//  Copyright © 2017 Ashlee Krammer. All rights reserved.
//

import Foundation

struct Horoscope: Codable {
    let mood: String
    let date_range: String
    let color: String
    let description: String
    let lucky_time: String
    let compatibility: String
    let current_date: String
    let lucky_number: String
}
