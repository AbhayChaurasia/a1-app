//
//  TabBarView.swift
//  A1App_Assignment
//
//  Created by Abhay Chaurasia on 25/07/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
            Text("Notification")
                .tabItem {
                    Image("notification")
                }
            Text("More")
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                }
        }
        .accentColor(.pink)
    }
}
