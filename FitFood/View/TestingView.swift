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
            .font(Font.custom("Parkinsans-Light", size: 10))
            .foregroundStyle(.green)
        
        Text("Hello World, World!")
            .font(Font.custom("Parkinsans-Regular", size: 20))
            .foregroundStyle(Color.theme.mediumOrange)
        
        Text("Hello World, World!")
            .font(Font.custom("Parkinsans-SemiBold", size: 30))
            .foregroundStyle(Color.theme.darkGray)
        
        Text("Hello World, World!")
            .font(Font.custom("Parkinsans-Bold", size: 40))
            .foregroundStyle(Color.theme.lightOrange)
    }
}

#Preview {
    TestingView()
}
