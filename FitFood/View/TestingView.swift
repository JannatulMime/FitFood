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
            .font(Font.custom("Parkinsans-Light", size: 20))
            .foregroundStyle(.green)
        
        Text("Hello World, World!")
            .font(Font.custom("Parkinsans-Regular", size: 20))
            .foregroundStyle(Color.theme.mediumOrange)
        
        Text("Hello World, World!")
            .modifier(LightFont(fontSize: FontSize.ExtraLarge.rawValue))
            .foregroundStyle(Color.theme.darkGray)
        
        Text("Hello World, World!")
           // .font(Font.custom("Parkinsans-Bold", size: 40))
            .modifier(BoldFont(fontSize: FontSize.ExtraLarge.rawValue))
            .foregroundStyle(Color.theme.lightOrange)
    }
}

#Preview {
    TestingView()
}
