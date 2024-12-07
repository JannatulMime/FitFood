//
//  ContentView.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 3/12/24.
//

import SwiftUI

struct ContentView: View {
   // @StateObject var vm = //CreateRecipeVM()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
