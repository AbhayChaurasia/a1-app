//
//  ListModel.swift
//  A1App_Assignment
//
//  Created by Abhay Chaurasia on 24/07/25.
//

import Foundation

struct ListItem: Identifiable, Decodable, Equatable {
    //var id = UUID()
    let image: String
    let email: String
    let name: String
    let age: Int
    let dob: String
    var id: String { email }
}
struct ListResponse: Decodable {
    let data: [ListItem]
}
