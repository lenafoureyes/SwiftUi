//
//  InfoRow.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct InfoRow: View {
    let post: Post
    
    var body: some View {
        HStack {
            Image(post.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            
            Text(post.title)
                .font(.headline)
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
