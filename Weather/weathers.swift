//
//  weathers.swift
//  Weather
//
// "city_name":"파리",
/*  "state":10,
    "celsius":11.3,
    "rainfall_probability":90*/

//  Created by 1 on 2022/05/26.
//

import Foundation

struct weathers: Codable {
    let city_name: String
    let state: Int
    let celsius: Double
    let rainfall_probability: Double
}
