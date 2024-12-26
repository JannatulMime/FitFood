//
//  CreateRecipeView.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 11/12/24.
//

import FitFoodCore
import RichTextKit
import SwiftUI

struct CreateRecipeView: View {
    var topBarConfig: CommonTopBarData

    @State private var selectedDate = Date()
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm: CreateRecipeVM

    init(recipe: Recipe? = nil) {
        _vm = StateObject(wrappedValue: CreateRecipeVM(recipe: recipe))
        let isEdit = recipe != nil
        topBarConfig = CommonTopBarData(title: isEdit ? "Edit" : "Create", bgColor: Color.theme.navyBlue, leftIconName: "chevron.left", rightIconName: isEdit ? "xmark.circle" : "")
    }

    var body: some View {
        NavigationStack {
            CommonTopBar(data: topBarConfig, onLeftButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()
            }, onRightButtonClicked: {
                self.presentationMode.wrappedValue.dismiss()

            })
            contentView
        }
        .navigationBarBackButtonHidden(true)
//        .navigationDestination(isPresented: $vm.goRecipeListPage, destination: {
//            RecipeListView()
//        })
    }
}

#Preview {
    CreateRecipeView()
}

extension CreateRecipeView {
    var contentView: some View {
        //        VStack(alignment: .leading, spacing: 15) {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 5) {
                recipeTitle

                description

                selectImageView

                // ingredients
                
                VStack {
                    selectCategory
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color.theme.lightGray)
                    
                    durationTime
                }
                
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white).shadow(color: Color.theme.darkGray, radius: 2, x: 0, y: 1))
                .padding()
               
                Spacer()
                saveOption
                Spacer().frame(height: 5)
            }
            
           
        }
        .background(Color.white)
        .padding()
    }

    var selectCategory: some View {
        HStack {
            Picker("", selection: $vm.selectedCategory) {
                ForEach(vm.categoryList, id: \.self) {
                    Text("\($0.title)")
                        .padding(.trailing,20)
                }

            }.pickerStyle(.navigationLink)
                .frame(height: 30)
                .background(
                    DefaultFormPicker(iconName: "folder.circle",
                                      mainTitle: "Category",
                                      rightTitle: vm.selectedCategory.id == "-1" ? "Select" :  "")
                ).padding()
                
        }
    }

    var saveOption: some View {
        HStack {
            if vm.isLoading {
                LoadingView()
            }
            
            
            Button {
                vm.saveData()

            } label: {
                Text("Create")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .modifier(CustomTextModifier(fontSize: 15, color: .white, weight: .bold))
                    .WithDefaultRectangularBgModifier(bgColor: Color.theme.navyBlue, cornerRadius: 20)
                    .padding(.horizontal, 50)
            }
        }
        .alert(isPresented: $vm.showAlert) {
            Alert(title: Text("Invalid Input"), message: Text(vm.alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    var recipeTitle: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Title")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))

            TextField("", text: $vm.title,
                      prompt: Text("Enter title")
                          .font(.caption)
                          .foregroundColor(.gray)
            )
            .foregroundStyle(.black)
            .frame(height: 20)
            .padding()

            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.theme.darkGray, radius: 2, x: 0, y: 1)
            )
        }.padding()
    }

    var description: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Description")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))
            // .padding(.bottom, 2)

            RichTextFormView(placeHolder: "Details", text: $vm.description)
        }.padding()
    }

    var selectImageView: some View {
        VStack(alignment: .leading) {
            Text("Recipe Image")
                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))

            CustomImagePicker(selectedImageData: $vm.pickedImage)
                .frame(maxWidth: .infinity)
                .frame(height: 170)

        }.padding()
    }

//    var ingredients: some View {
//        VStack(alignment: .leading) {
//            Text("Ingredients")
//                .modifier(CustomTextModifier(fontSize: 18, color: .black, weight: .bold))
//
//            TextField("", text: $vm.ingredients,
//                      prompt: Text("Write here your ingredients")
//                          .font(.caption)
//                          .foregroundColor(.gray)
//            )
//            .foregroundStyle(.black)
//            .frame(height: 20)
//            .padding()
//
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.white)
//                    .shadow(color: Color.gray, radius: 2, x: 1, y: 1)
//            )
//        }
//    }

    var durationTime: some View {
        HStack {
            Picker("", selection: $vm.selectedDuration) {
                ForEach(vm.durationList, id: \.self) {
                    Text("\($0) min")
                        .padding(.trailing,20)
                }.foregroundStyle(Color.theme.navyBlue)

            }.pickerStyle(.navigationLink)
                .frame(height: 30)
                .background(
                    DefaultFormPicker(iconName: "timer",
                                      mainTitle: "Duration",
                                      rightTitle:  vm.selectedDuration == "" ? "Select" : "")
                ).padding()

        }
    }
}
