//
//  LoginProfileView.swift
//  FitFood
//
//  Created by Habibur Rahman on 4/12/24.
//

import SwiftUI

struct LoginProfileView: View {
    @StateObject var vm = LoginProfileVM()
    @Environment(\.presentationMode) var presentationMode
    
    let topBarConfig = CommonTopBarData(title: "Login", bgColor: Color.theme.lightGray, leftIconName: "chevron.left", rightIconName: "")

    var body: some View {
        NavigationStack {
            
            CommonTopBarView(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            }
            )
            
            VStack(spacing: 50) {
                Spacer()
                    .frame(height: 10)
                
                nameTextField
                emailTextField
                loginProfileButton
                signUpButton
                
                Spacer()
            }
            .padding(.horizontal, 25)
            
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $vm.gotoSignUpView, destination: {
                    SignUpView()
                })
            
        }
    }
}

#Preview {
    LoginProfileView()
}

extension LoginProfileView {
    var nameTextField: some View {
        VStack(alignment: .leading) {
            Text("Email")
                .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))

            TextField("Put your email", text: $vm.email)
                .foregroundStyle(.black)

                .background(
                    VStack {
                        Spacer()
                        Color(UIColor.gray)
                            .frame(height: 1)
                    }
                )
        }
    }

    var emailTextField: some View {
        VStack(alignment: .leading) {
            Text("Password")
                .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))

            TextField("Put your password", text: $vm.password)
                .foregroundStyle(.black)

                .background(
                    VStack {
                        Spacer()
                        Color(UIColor.gray)
                            .frame(height: 1)
                    }
                )
        }
    }
    
    var loginProfileButton: some View {
        HStack {
            Button {
              
                vm.gotoSignUpView = true
            } label: {
                Text("Login Profile")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.theme.orangie))
                  //  .padding(.horizontal,50)
            
                   
                   
            }
        }
    }
    
    var signUpButton: some View {
        HStack {
            Text("Don't have any account?")
                .modifier(RegularFont(fontSize: FontSize.Small.rawValue))
            
            Button {
                vm.gotoSignUpView = true
                
             
            } label: {
                Text("Sign UP")
//
                    .modifier(BoldFont(fontSize: FontSize.Small.rawValue))
                    .foregroundColor(Color.theme.darkOrange)
                  
            }
        }
    }
}
