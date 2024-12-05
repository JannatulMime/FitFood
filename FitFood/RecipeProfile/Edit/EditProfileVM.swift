//
//  EditProfileVM.swift
//  FitFood
//
//  Created by Habibur Rahman on 4/12/24.
//

import Foundation

class EditProfileVM: ObservableObject {
    @Published var name: String = ""
    @Published var image: String = "Cake"
    @Published var email: String = ""
    @Published var gotoProfileView: Bool = false
}
