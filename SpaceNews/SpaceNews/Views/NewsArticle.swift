//
//  NewsArticle.swift
//  SpaceNews
//
//  Created by mert Kanak on 4.05.2023.
//

import SwiftUI

struct NewsArticle: View {
    let title: String
    let imageUrl: String
    let siteName: String
    let summary: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(siteName)
                .foregroundColor(.blue)
                .italic()
            
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: imageUrl),
                                 transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .transition(.opacity)
                    } else {
                        HStack {
                            // Placeholder
                        }
                    }
                }
            }
            
            Text(title)
                .font(.headline)
                .padding(8)
            
            Text(summary)
                .lineLimit(6)
                .font(.body)
                .padding(8)
        }
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "Code Palace", imageUrl: ".....", siteName: "Code Palace", summary: "Check out Code Palace for more tutorials ")
    }
}
