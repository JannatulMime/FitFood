//
//  SignUpView.swift
//  FitFood
//
//  Created by Habibur Rahman on 4/12/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var vm = SignUpVM()
    @Environment(\.presentationMode) var presentationMode
    
    let topBarConfig = CommonTopBarData(title: "Sign Up", bgColor: Color.theme.lightGray, leftIconName: "chevron.left", rightIconName: "")

    
    var body: some View {
        NavigationStack {
            
            CommonTopBarView(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            }
            )
            
            VStack(spacing: 50) {
                Spacer()
                    .frame(height: 10)
                
                userName
                userEmail
                userPassword
                signUpButton
                signInButton
                
                Spacer()
            }.padding(.horizontal, 25)
            
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $vm.gotoProfileView, destination: {
                    ProfileView()
                })
            
        }
    }
}

#Preview {
    SignUpView()
}


extension SignUpView {
    var userName: some View {
        VStack(alignment: .leading) {
            Text("Name")
                .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))

            TextField("Write your name", text: $vm.profileName)
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

    var userEmail: some View {
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
    
    var userPassword: some View {
        VStack(alignment: .leading) {
            Text("Passord")
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

    
    var signUpButton: some View {
        HStack {
            Button {
                
             
            } label: {
                Text("SignUp")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.theme.orangie))
                  //  .padding(.horizontal,50)
            
                   
                   
            }
        }
    }
    
    var signInButton: some View {
        HStack {
            Text("Already have an account!")
                .modifier(RegularFont(fontSize: FontSize.Small.rawValue))
            
            Button {
               
                vm.gotoProfileView = true
            } label: {
                Text("Sign In")
                    .modifier(BoldFont(fontSize: FontSize.Small.rawValue))
                    .foregroundColor(Color.theme.mediumOrange)
                  
            }
        }
    }
}
