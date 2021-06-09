//
//  EventsModel.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 17.05.2021.
//

import Foundation

var params = [[]]

struct EventsApiREsponse: Decodable {
    let count: Int
    let next: String
    let results: [Event]
}

struct Event: Decodable {
    let id: Int
    let dates: [EventDate]
    let title: String
    let images: [Image]
}

struct EventDate: Decodable {
    let start: Int
    let end: Int
}
struct Image: Decodable {
    let image: String
}
