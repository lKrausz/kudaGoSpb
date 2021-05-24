//
//  AppEndPoint.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 17.05.2021.
//

import Foundation

protocol EndPointType {
    var baseUrl: URL { get }
    var path: URL { get }
}


public enum kudagoApi {
    case locations
    case events
}

extension kudagoApi: EndPointType {
 
    var baseUrl: URL {
        guard let url = URL(string: "https://kudago.com/public-api/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var version: String {
        return "v1.4"
    }
    
    var language: String {
        return "/?lang=ru"
    }

    
    var path: URL {
        switch self {
        case .locations:
            return  baseUrl.appendingPathComponent(version + "/locations")
        case .events:
            return  baseUrl.appendingPathComponent(version + "/events")
        }
    }
}
