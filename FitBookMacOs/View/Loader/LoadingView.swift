//
//  LoadingView.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 21/12/24.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
          //  Color(.systemBackground)
            Color(Color.black)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.theme.navyBlue))
                .scaleEffect(2)
            
        }.onAppear{ startLoading() }
    }
    
    func startLoading() {
        isLoading = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            isLoading = false
//        }
    
    }
}

#Preview {
    LoadingView()
}
