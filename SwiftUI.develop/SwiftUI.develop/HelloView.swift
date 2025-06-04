//
//  HelloView.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct HerbCombinatorView: View {
    @State private var selectedHerbs: [Post] = []
    @State private var newDescription = ""
    @State private var showRecipe = false
    @State private var recipeTitle = "Мой рецепт"
    
    @Binding var allPosts: [Post] // Для обновления основного списка
    let allHerbs: [Post]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 1. Список всех трав для выбора
                List {
                    ForEach(allHerbs) { herb in
                        HStack {
                            Image(herb.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                            
                            Text(herb.title)
                                .font(.system(size: 16))
                            
                            Spacer()
                            
                            if selectedHerbs.contains(where: { $0.id == herb.id }) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                toggleHerbSelection(herb)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                // 2. Панель управления
                VStack(spacing: 16) {
                    if !selectedHerbs.isEmpty {
                        if showRecipe {
                            TextField("Название рецепта", text: $recipeTitle)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                        
                        HStack(spacing: 16) {
                            // Кнопка создания/сохранения рецепта
                            Button(action: {
                                if showRecipe {
                                    saveRecipe()
                                } else {
                                    combineHerbs()
                                }
                            }) {
                                HStack {
                                    Image(systemName: showRecipe ? "checkmark" : "leaf.arrow.triangle.circlepath")
                                    Text(showRecipe ? "Сохранить" : "Создать")
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.green)
                            .disabled(showRecipe && recipeTitle.isEmpty)
                            
                            // Кнопка очистки
                            Button(action: clearSelection) {
                                HStack {
                                    Image(systemName: "trash")
                                    Text("Стереть")
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                            .tint(.red)
                        }
                        .padding(.horizontal)
                    }
                    
                    // 3. Область рецепта
                    if showRecipe {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Ваш рецепт")
                                    .font(.title3.bold())
                                
                                Spacer()
                                
                                Button(action: clearRecipe) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal)
                            
                            ScrollView {
                                Text(newDescription)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(height: 200)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        .transition(.move(edge: .bottom))
                    }
                }
                .padding(.vertical)
                .background(Color(.systemBackground))
            }
            .navigationTitle("Комбинатор трав")
            .animation(.spring(), value: selectedHerbs)
        }
    }
    
    private func toggleHerbSelection(_ herb: Post) {
        if let index = selectedHerbs.firstIndex(where: { $0.id == herb.id }) {
            selectedHerbs.remove(at: index)
        } else {
            selectedHerbs.append(herb)
        }
        if showRecipe {
            withAnimation {
                showRecipe = false
                newDescription = ""
                recipeTitle = "Мой рецепт"
            }
        }
    }
    
    private func combineHerbs() {
        withAnimation {
            newDescription = selectedHerbs.map { "▸ \($0.title):\n\($0.description)" }.joined(separator: "\n\n")
            showRecipe = true
        }
    }
    
    private func saveRecipe() {
        var newPost = Post(
            title: recipeTitle,
            description: newDescription,
            imageName: "leaf.fill"
        )
        newPost.isCustomRecipe = true 
        
        withAnimation {
            allPosts.append(newPost)
            clearSelection()
        }
    }
    
    private func clearSelection() {
        withAnimation {
            selectedHerbs.removeAll()
            showRecipe = false
            newDescription = ""
            recipeTitle = "Мой рецепт"
        }
    }
    
    private func clearRecipe() {
        withAnimation {
            showRecipe = false
            newDescription = ""
            recipeTitle = "Мой рецепт"
        }
    }
}
