//
//  TestingView.swift
//  FitFood
//
//  Created by Habibur Rahman on 30/11/24.
//

import SwiftUI

struct TestingView: View {
    var body: some View {
        Text("Hello World, World!")
            //.font(Font.custom("Outfit-Thin_Light", size: 20))
            .font(Font.font.regular(size: 35))
            .foregroundStyle(Color.theme.red)
    }
}

#Preview {
    TestingView()
}
