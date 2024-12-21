//
//  CreateCategoryView.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 14/12/24.
//

import SwiftUI
import FitFoodCore

struct CreateCategoryView: View {
   
    @StateObject var vm: CreateCategoryVM
    @Environment(\.presentationMode) var presentationMode
    var topBarConfig: CommonTopBarData
    
    
    
    init(recipeCategory: RecipeCategory? = nil) {
        _vm = StateObject(wrappedValue: CreateCategoryVM(recipeCategory: recipeCategory))
       
        topBarConfig = CommonTopBarData(title: "CreateCategory", bgColor: Color.theme.navyBlue, leftIconName: "chevron.left", rightIconName: "")
    }
    
    var body: some View {
        
        CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
            self.presentationMode.wrappedValue.dismiss()
        })
        contentView
        Spacer()
    }
}

#Preview {
    CreateCategoryView()
}

extension CreateCategoryView {
    var contentView: some View {
        VStack(spacing: 50) {
            Spacer()
                .frame(height: 5)
            VStack(alignment: .leading) {
                Text("Title")
                    .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))
                
                TextField("", text: $vm.title,
                          prompt: Text("Enter title")
                    .font(.caption)
                    .foregroundColor(.gray)
                )
                .foregroundStyle(.black)
                .frame(height: 15)
                .padding()
                
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.gray, radius: 2, x: -1, y: 1)
                    
                    
                )
            }
            
           
            VStack(alignment: .leading) {
                    Text("Recipe Image")
                    .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))

                    CustomImagePicker(selectedImageData: $vm.pickedImage)
                        .frame(maxWidth: .infinity)
                        .frame(height: 170)
                    
                }
            
            HStack {
                Button {
                   
                    vm.saveCategory()
                } label: {
                    Text("Save")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .modifier(CustomTextModifier(fontSize: 20, color: .white, weight: .bold))
                        .WithDefaultRectangularBgModifier(bgColor: Color.theme.navyBlue, cornerRadius: 20)
                      
                }
            }

        }.padding(.horizontal, 30)
       
    }
}
