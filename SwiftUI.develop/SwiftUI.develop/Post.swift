//
//  Post.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()  // Уникальный идентификатор для List
    let title: String
    let description: String
    let imageName: String  // Название изображения в Assets
}
