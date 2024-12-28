//
//  HomeView.swift
//  FitFood
//
//  Created by Habibur Rahman on 27/11/24.
//

import FitFoodCore
import SwiftUI

struct HomeView: View {
    var userName: String
    let recipes: [Recipe]

    @State var searchText: String = ""
    @StateObject var vm = HomeVM()

    var body: some View {
        NavigationStack {
            VStack {
                profileNameAndImage
                    .padding(.horizontal, 20)
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        searchBar
                        catagories
                        poplularSection
                        todaysSection

                        Spacer()
                    }.padding(.horizontal, 30)
                }
            }

            .navigationDestination(isPresented: $vm.goToDetailsPage, destination: {
                if let selectedRecipe = vm.selectedRecipe {
                    DetailsRecipeView(recipe: selectedRecipe)
                }

            })

            .navigationDestination(isPresented: $vm.goToProfileView, destination: {
                ProfileView()
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
            Image("Berry cake")
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(.circle)
                .scaledToFit()
                .onTapGesture {
                    vm.goToProfileView = true
                }

            Text("Welcome,  \(userName)")
                .modifier(BoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkOrange)

            Spacer()
        }
    }

    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.theme.mediumGray)

            TextField("Search", text: $searchText)

        }.padding()
            .background(Color.theme.lightGray.opacity(0.3))
            .cornerRadius(10)
    }

    var catagories: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Catagories")
                .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))
                .foregroundStyle(Color.theme.darkGray)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0 ..< 5) { _ in
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
                    ForEach(vm.popularRecipe) { recipe in
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
