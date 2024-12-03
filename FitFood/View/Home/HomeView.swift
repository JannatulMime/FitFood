//
//  HomeView.swift
//  FitFood
//
//  Created by Habibur Rahman on 27/11/24.
//

import SwiftUI

struct HomeView: View {
    var userName: String
    let recipes: [Recipe]
    
    @State var searchText: String = ""
    @StateObject var vm = HomeVM()

   // var onRecipePressed : (Recipe) -> Void
  //  @State var isRecipePressed : Bool = false

    
    var body: some View {
        NavigationStack {
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
            .navigationDestination(isPresented: $vm.goToDetailsPage, destination: {
                if let selectedRecipe = vm.selectedRecipe {
                    DetailsRecipeView(recipe: selectedRecipe)
                }
               
            })
        }
    }
        
}

#Preview {
    HomeView(userName: "Pappu", recipes: [dummyRecipe1, dummyRecipe2, dummyRecipe4, dummyRecipe5, dummyRecipe6])
}


extension HomeView {
    var profileNameAndImage: some View {
        HStack {
            Text("Welcome,  \(userName)")
                .modifier(BoldFont(fontSize: FontSize.Large.rawValue))
                .foregroundStyle(Color.theme.darkOrange)
                
            
            Spacer()
            
            Image("Berry cake")
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
                    ForEach(recipes) { recipe in
                        SinglePopularSection(recipe: recipe)
                        
                           .onTapGesture {
                               vm.goToDetailsPage = true
                              vm.selectedRecipe = recipe
                           
                    }
                      
                    }
                    
                }
            }
        }
    }
    
    var todaysSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Today's Recipe")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)
            
                VStack(spacing: 15) {
                    ForEach(recipes) { recipe in
                        SingleTodaysRecipe(recipe: recipe)
                        
                            .onTapGesture {
                                vm.goToDetailsPage = true
                                vm.selectedRecipe = recipe
                            
                     }
                    }
                    
                    
               
            }
            
        }
    }
}
