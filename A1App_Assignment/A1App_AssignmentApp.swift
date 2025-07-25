//
//  A1App_AssignmentApp.swift
//  A1App_Assignment
//
//  Created by Abhay Chaurasia on 22/07/25.
//

import SwiftUI



@main
struct A1App_AssignmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
