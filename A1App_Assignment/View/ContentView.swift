//
//  ContentView.swift
//  A1App_Assignment
//
//  Created by Abhay Chaurasia on 22/07/25.
//

import SwiftUI
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


