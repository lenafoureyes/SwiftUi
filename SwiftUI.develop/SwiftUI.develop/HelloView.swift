//
//  HelloView.swift
//  SwiftUI.develop
//
//  Created by Елена Хайрова on 03.06.2025.
//

import SwiftUI

struct HelloView: View {
    var body: some View {
        VStack {
            Text("Hello world!")
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Hello")
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
