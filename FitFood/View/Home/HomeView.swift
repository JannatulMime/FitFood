//
//  HomeView.swift
//  FitFood
//
//  Created by Habibur Rahman on 27/11/24.
//

import SwiftUI

struct HomeView: View {
    var userName: String
    @State var searchText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                profileNameAndImage
                searchBar
                catagories
                poplularSection
                todaysSection
                
                Spacer()
            }.padding(.horizontal, 30)
        }
    }
}

#Preview {
    HomeView(userName: "Pappu")
}


extension HomeView {
    var profileNameAndImage: some View {
        HStack {
            Text("Welcome,  \(userName)")
                .modifier(BoldFont(fontSize: FontSize.Large.rawValue))
                .foregroundStyle(Color.theme.darkOrange)
                
            
            Spacer()
            
            Image("Orange")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(.circle)
                .scaledToFit()
            
        }
    }
    
    var searchBar: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding()
                .background(Color.theme.lightGray.opacity(0.3))
                .cornerRadius(10)
              
        }
    }
    
    var catagories: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Catagories")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<5) { type in
                        SingleCatagoryButton(catagory: "Breakfast", image: "Orange")
                    }
                    
                }
            }
        }
    }
    
    var poplularSection: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Popular")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<5) { type in
                        SinglePopularSection(recipeImage: "Applepie", recipeName: "ApplePie", calories: "320cal", time: "20min")
                    }
                    
                }
            }
        }
    }
    
    var todaysSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Today's recipe")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)
            
          //  ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(0..<5) { type in
                        SingleTodaysRecipe(recipeImage: "Orange", recipeName: "Blueberry Cookies", calories: "240cal", time: "15min")
                    }
                    
                    
                }//.padding()
           // }
            
        }
    }
}
