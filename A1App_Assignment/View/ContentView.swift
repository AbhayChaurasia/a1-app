//
//  ContentView.swift
//  A1App_Assignment
//
//  Created by Abhay Chaurasia on 22/07/25.
//

import SwiftUI
import CoreData
import SDWebImage
import SDWebImageSwiftUI


struct ContentView: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white.ignoresSafeArea()
            VStack(   spacing: 12) {
                // Top Red Header
                LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.8), Color.pink.opacity(0.5)]),
                               startPoint: .top,
                               endPoint: .bottom)
                .frame(height: 200)
                .overlay(
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Image(systemName: "ellipsis")
                                .foregroundColor(.white)
                        }
                        
                        .padding(.horizontal)
                        
                        Text("Summer")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("96 Wardrobes")
                            .foregroundColor(.white.opacity(0.8))
                    }
                        .padding(.horizontal)
                        .padding(.top, 8),
                    alignment: .topLeading
                )
                
                // Card List
                ScrollView {
                    VStack(spacing: 42) {
                        ForEach(viewModel.items) { item in
                            ListCardView(item: item)
                                .onAppear {
                                    if item == viewModel.items.last {
                                        viewModel.fetchWardrobes()
                                    }
                                }
                        }
                        
                        if viewModel.isLoading {
                            ProgressView()
                                .padding()
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            viewModel.fetchWardrobes()
        }
    }
}


struct ListCardView: View {
    let item: ListItem
    
    var body: some View {
        HStack(spacing: 8) {
           
            if let url = URL(string:  item.image) {
                WebImage(url: url)
                
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 170)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                    .offset(x: 0, y: -35)
                
            }
            
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.name)
                    .font(.headline)
                Text("by Pantaloons")
                    .font(.subheadline)
                    .foregroundColor(.pink)
                
                HStack(spacing: 4) {
                    ForEach(0..<3) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    ForEach(0..<2) { _ in
                        Image(systemName: "star")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
                
                Text("$260")
                    .font(.subheadline)
                    .bold()
            }
            
            Spacer()
            
            Button("Shop") {}
                .font(.caption)
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
        )
    }
}


 
