//
//  NetworkManager.swift
//  kudaGoSpb
//
//  Created by Виктория Козырева on 17.05.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    let params = ["lang" : "ru"]
    
    func getOnboardingData(url: URL, completion: @escaping ([OnboardingApiResponse]) -> ()) {
        AF.request(url, method: .post, parameters: params, encoder: URLEncodedFormParameterEncoder(destination: .queryString)).response { response in
            guard let responseData = response.data else {
                print("no data")
                return
            }
            do {
                let decodeData = try JSONDecoder().decode([OnboardingApiResponse].self, from: responseData)
            completion(decodeData)
            } catch {
                print(error)
            }
        }
    }
    
}
