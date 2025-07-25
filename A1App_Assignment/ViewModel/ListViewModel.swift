//
//  ListViewModel.swift
//  A1App_Assignment
//
//  Created by Abhay Chaurasia on 24/07/25.
//

import Foundation
import Combine

//class ListViewModel: ObservableObject {
//    @Published var items: [ListItem] = []
//    @Published var isLoading = false
//
//    private var currentPage = 1
//    private let pageSize = 5
//    private var canLoadMore = true
//
//    func fetchWardrobes() {
//        guard !isLoading, canLoadMore else { return }
//        isLoading = true
//       // https://core-apis.a1apps.co/ios/interview-details
//
//        let urlString = "https://core-apis.a1apps.co/ios/interview-details" // replace with your real endpoint
//        guard let url = URL(string: urlString) else { return }
//
//        let config = URLSessionConfiguration.ephemeral
//
//        //config.timeoutIntervalForResource = 60
//      //  config.timeoutIntervalForRequest = 30
//        let session = URLSession(configuration: config)
//
//        session.dataTask(with: url) { [weak self] data, _, error in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//            }
//            guard let data = data, error == nil else { return }
//            print(String(data:  data, encoding: .utf8))
//            do {
//                let response = try JSONDecoder().decode(ListResponse.self, from: data)
//                DispatchQueue.main.async {
//                    let newItems = Array(response.data.prefix(self?.pageSize ?? 5))
//                    if newItems.count < self?.pageSize ?? 5 {
//                        self?.canLoadMore = false
//                    }
//                    self?.items += newItems
//                    self?.currentPage += 1
//                }
//            } catch {
//                print("Error decoding: \(error)")
//            }
//        }.resume()
//    }
//}
import Foundation
import Combine

class ListViewModel: ObservableObject {
    @Published var items: [ListItem] = []
    @Published var isLoading = false

    private var currentPage = 1
    private let pageSize = 5
    private var canLoadMore = true

    func fetchWardrobes() {
        guard !isLoading, canLoadMore else { return }
        isLoading = true

        NetworkManager.shared.fetchWardrobes { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let data):
                    
                    
                    
                    let newItems = Array(data.prefix(self?.pageSize ?? 5))
                    if newItems.count < self?.pageSize ?? 5 {
                        self?.canLoadMore = false
                    }
                    self?.items += newItems
                    self?.currentPage += 1
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}
