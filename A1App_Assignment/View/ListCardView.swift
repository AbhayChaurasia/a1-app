//
//  ListCardView.swift
//  A1App_Assignment
//
//  Created by Abhay on 25/07/25.
//
import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

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


 
