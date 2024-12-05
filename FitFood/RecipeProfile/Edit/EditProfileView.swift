//
//  EditProfileView.swift
//  FitFood
//
//  Created by Habibur Rahman on 4/12/24.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var vm = EditProfileVM()
    @Environment(\.presentationMode) var presentationMode
    
    let topBarConfig = CommonTopBarData(title: "Edit Profile", bgColor: Color.theme.lightGray, leftIconName: "chevron.left", rightIconName: "")

    
    var body: some View {
        NavigationStack {
            
            CommonTopBarView(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            }
            )
            
            VStack(spacing: 50) {
                profileImage
                userName
              //  userEmail
                saveButton
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    EditProfileView()
}

extension EditProfileView {
    var profileImage: some View {
        Image(vm.image)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .shadow(radius: 10)
    }
    
    
    var userName: some View {
        VStack(alignment: .leading) {
            Text("Name")
                .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
            
            TextField("Put your name", text: $vm.name)
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
    
    var saveButton: some View {
        HStack {
            Button {
               
            } label: {
                Text("Save")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .modifier(SemiBoldFont(fontSize: FontSize.Small.rawValue))
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.theme.orangie))
                  //  .padding(.horizontal,50)
            
                   
            }
        }
    }
    
    
}
