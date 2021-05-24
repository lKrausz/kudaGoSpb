//
//  LocationModel.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 17.05.2021.
//

import Foundation

typealias Location = [LocationApiResponce]

struct LocationApiResponce: Decodable {
    let slug: String
    let name: String
}
