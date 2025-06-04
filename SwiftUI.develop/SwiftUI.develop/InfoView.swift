//
//  InfoView.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct InfoView: View {
    let posts: [Post]  
    var titleOn: Bool
    var rowHeight: Double

    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: InfoDetails(post: post)) {
                    InfoRow(post: post, rowHeight: rowHeight)
                }
                .listRowInsets(EdgeInsets())
                .frame(height: rowHeight)
            }
            .navigationTitle(titleOn ? "Травы" : "")
        }
    }
}
