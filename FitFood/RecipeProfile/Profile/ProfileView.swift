//
//  ProfileView.swift
//  FitFood
//
//  Created by Habibur Rahman on 4/12/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ProfileVM()
    @Environment(\.presentationMode) var presentationMode
    
    let topBarConfig = CommonTopBarData(title: "Profile", bgColor: Color.theme.lightGray, leftIconName: "chevron.left", rightIconName: "pencil")

    
    var body: some View {
        NavigationStack {
            CommonTopBarView(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            }, onRightButtonClicked: { vm.gotoEditProfile = true }
            )
            
            content
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $vm.gotoEditProfile, destination: {
                    EditProfileView()
                })
        }
    }
}

#Preview {
    ProfileView()
}


extension ProfileView {
    var content: some View {
        VStack(alignment: .center, spacing: 15) {
            Spacer()
                .frame(height: 20)
            
            profilePic
            profileName
            profileEmail

            Spacer()
        }
    }

    var profilePic: some View {
        Image(vm.image)
                .resizable()
                .frame(width: 120, height: 100)
                .clipShape(.circle)
                .scaledToFit()
        }

    var profileName: some View {
        Text(vm.name)
            .modifier(BoldFont(fontSize: FontSize.Large.rawValue))

    }

    var profileEmail: some View {
        Text(vm.email)
            .modifier(SemiBoldFont(fontSize: FontSize.Regular.rawValue))

    }
}
