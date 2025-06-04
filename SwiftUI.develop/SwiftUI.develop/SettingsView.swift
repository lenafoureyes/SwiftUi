//
//  SettingsView.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct SettingsView: View {
    @State private var isToggleOn = true
    @State private var selectedOption = 0
    @State private var sliderValue = 50.0
    @State private var isChanging = false
    
    @Environment(\.colorScheme) var theme
    @Binding var titleOn: Bool
    @Binding var rowHeight: Double
    
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        Form {
            // Секция  : темная светлая тема
            Section(header: Text("Тема")) {
                Text(theme == .dark ? "Dark Theme enabled" : "Light Theme enabled")
            }
            // Секция : Основные настройки
            Section(header: Text("Основные")) {
                Toggle("Включить уведомления", isOn: $isToggleOn)
                Picker("Выбор опции", selection: $selectedOption) {
                    ForEach(options.indices, id: \.self) { index in
                        Text(self.options[index]).tag(index)
                    }
                }
            }
            
            // секция  : заголовок
            Section(header: Text("Заголовок")) {
                Toggle("Показывать заголовок", isOn: $titleOn) // Связываем с titleOn
                
                if titleOn {
                    Text("Navigation title enabled")
                        .foregroundColor(.gray)
                }
            }
            Section(header: Text("Размер строки")) {
                Slider(
                    value: $rowHeight,
                    in: 40...100, // Диапазон высоты
                    step: 5,
                    onEditingChanged: { editing in
                        isChanging = editing
                    }
                )
                
                Text("Текущая высота: \(Int(rowHeight)) пунктов")
                    .foregroundColor(.gray)
                
                // Превью строки (показывается только при изменении)
                if isChanging {
                    InfoRow(
                        post: Post(
                            title: "Пример",
                            description: "Это превью",
                            imageName: "leaf.fill"
                        ),
                        rowHeight: rowHeight
                    )
                    .padding(.vertical)
                }
            }
            Section(header: Text("Дополнительно")) {
                Slider(value: $sliderValue, in: 0...100) {
                    Text("Уровень")
                }
                Text("Значение: \(Int(sliderValue))")
                    .foregroundColor(.gray)
            }
            .navigationTitle("Настройки")
        }
    }
}
