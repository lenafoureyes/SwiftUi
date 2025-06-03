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
    
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        Form {
            // Секция 1: Основные настройки
            Section(header: Text("Основные")) {
                Toggle("Включить уведомления", isOn: $isToggleOn)
                Picker("Выбор опции", selection: $selectedOption) {
                    ForEach(options.indices, id: \.self) { index in
                        Text(self.options[index]).tag(index)
                    }
                }
            }
            
            // Секция 2: Дополнительные настройки
            Section(header: Text("Дополнительно")) {
                Slider(value: $sliderValue, in: 0...100) {
                    Text("Уровень")
                }
                Text("Значение: \(Int(sliderValue))")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Настройки")
    }
}
