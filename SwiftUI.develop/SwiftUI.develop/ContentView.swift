//
//  ContentView.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isTitleEnabled") var titleOn = true
    @AppStorage("rowHeight") var rowHeight: Double = 50
    
    var body: some View {
        TabView {
            // 1-я вкладка: InfoView
            InfoView(titleOn: titleOn, rowHeight: rowHeight)
                .tabItem {
                    Label("Травы", systemImage: "leaf.fill")
                }
            
            // 2-я вкладка: HelloView
            HelloView()
                .tabItem {
                    Label("Hello", systemImage: "hand.wave.fill")
                }
            
            // 3-я вкладка: SettingsView 
            SettingsView(titleOn: $titleOn, rowHeight: $rowHeight)
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
