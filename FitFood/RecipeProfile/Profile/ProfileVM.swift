//
//  ProfileVM.swift
//  FitFood
//
//  Created by Habibur Rahman on 4/12/24.
//

import Foundation


class ProfileVM: ObservableObject {
   
    @Published var image: String = "Blue cake"
    @Published var name: String = "Nick"
    @Published var email: String = "nick@yahoo.com"
    
    @Published var gotoEditProfile: Bool = false
}
