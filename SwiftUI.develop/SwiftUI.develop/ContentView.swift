//
//  ContentView.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // 1-я вкладка: InfoView
            InfoView()
                .tabItem {
                    Label("Травы", systemImage: "leaf.fill")
                }
            
            // 2-я вкладка: HelloView
            HelloView()
                .tabItem {
                    Label("Hello", systemImage: "hand.wave.fill")
                }
            
            // 3-я вкладка: SettingsView 
            SettingsView()
                .tabItem {
                    Label("Настройки", systemImage: "gearshape.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
