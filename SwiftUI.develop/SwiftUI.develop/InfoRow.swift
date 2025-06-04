//
//  InfoRow.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct InfoRow: View {
    let post: Post
    let rowHeight: Double

    var body: some View {
        HStack {
            Image(post.imageName)
                .resizable()
                .frame(width: rowHeight * 0.8, height: rowHeight * 0.8)
                .cornerRadius(8)
            
            Text(post.title)
                .font(.system(size: rowHeight * 0.3))
            
            Spacer()
        }
        .frame(height: rowHeight) 
    }
}
