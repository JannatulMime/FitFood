//
//  LoginProfileVM.swift
//  FitFood
//
//  Created by Habibur Rahman on 4/12/24.
//

import Foundation

class LoginProfileVM: ObservableObject {
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var gotoSignUpView: Bool = false
}
