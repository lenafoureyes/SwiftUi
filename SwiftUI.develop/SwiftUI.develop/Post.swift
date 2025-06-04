//
//  Post.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//
import SwiftUI

struct Post: Identifiable, Equatable {
    let id = UUID()  
    var title: String
    var description: String
    var imageName: String
    var isCustomRecipe: Bool = false
    
    // Реализация Equatable
    static func == (lhs: Post, rhs: Post) -> Bool {
        lhs.id == rhs.id
    }
}
