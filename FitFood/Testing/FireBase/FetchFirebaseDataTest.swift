//
//  FetchFirebaseDataTest.swift
//  FitFood
//
//  Created by Habibur Rahman on 3/12/24.
//

import SwiftUI

struct FetchFirebaseDataTest: View {
    
    @StateObject var vm = FirebaseDataFetcher()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FetchFirebaseDataTest()
}
