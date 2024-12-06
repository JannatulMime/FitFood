//
//  HomeVM.swift
//  FitFood
//
//  Created by Habibur Rahman on 3/12/24.
//

import Foundation

class HomeVM: ObservableObject {
    @Published var goToDetailsPage: Bool = false
    @Published var selectedRecipe: Recipe?
    @Published var goToProfileView: Bool = false
}
