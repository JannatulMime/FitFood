//
//  SignUpVM.swift
//  FitFood
//
//  Created by Habibur Rahman on 4/12/24.
//

import Foundation

class SignUpVM: ObservableObject {
   
    @Published var password: String = ""
    @Published var profileName: String = ""
    @Published var email: String = ""
//    @Published var profileImage: String? = ""
    @Published var gotoProfileView: Bool = false
    
}
