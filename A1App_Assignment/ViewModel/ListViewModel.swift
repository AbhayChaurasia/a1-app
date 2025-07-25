//
//  ListViewModel.swift
//  A1App_Assignment
//
//  Created by Abhay Chaurasia on 24/07/25.
//

import Foundation
import Combine


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
