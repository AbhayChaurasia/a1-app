//
//  NetworkManager.swift
//  A1App_Assignment
//
//  Created by Abhay Chaurasia on 25/07/25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    

    func fetchWardrobes(completion: @escaping (Result<[ListItem], Error>) -> Void) {
        guard let url = URL(string: EndPoint.baseURL) else {
            completion(.failure(NSError(domain: EndPoint.invalidURL_Message, code: -1)))
            return
        }
             let config = URLSessionConfiguration.ephemeral
        
                //config.timeoutIntervalForResource = 60
              //  config.timeoutIntervalForRequest = 30
                let session = URLSession(configuration: config)
 
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -2)))
                return
            }

            do {
                let response = try JSONDecoder().decode(ListResponse.self, from: data)
                completion(.success(response.data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
