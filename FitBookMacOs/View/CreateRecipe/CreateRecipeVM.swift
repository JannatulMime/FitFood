//
//  CreateRecipeVM.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 3/12/24.
//

// import Foundation
// import FirebaseHelper
//
// class CreateRecipeVM: ObservableObject {
//    //var datas = [FirebaseHelper.Recipe]()
//    init() {
//        let helper = FirebaseDataHelper()
//       // helper.fetchAllRecipe()
//    }
// }

import FirebaseHelper
import FitFoodCore
import Foundation

class CreateRecipeVM: ObservableObject {
    @Published var title: String = ""
    @Published var description: NSAttributedString = NSAttributedString.empty
    @Published var ingredients: [String] = []
    @Published var selectedCategory: RecipeCategory = RecipeCategory(id: "-1", title: "", imageUrl: "")
    @Published var duration: String = ""
    @Published var image: String? = ""
    @Published var goRecipeListPage: Bool = false
    @Published var pickedImage: Data?
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var showPicker = false
    
    var isEdit: Bool = false
    let localFileStore = LocalFileStore()

    let firebasRecipeManager = FirebaseRecipeManager(root: "Test")

    @Published var categoryList: [RecipeCategory] = []
    let firebaseCategoryManager = FirebaseRecipeCategoryManager(root: "Test")
    @Published var categoryListString: [String] = ["one", "two", "three"]
    
    @Published var selectedDuration: String = ""
    var durationList: [String] = ["10", "20", "30", "40", "50", "60"]
    

    init(recipe: Recipe?) {
        if let recipe = recipe {
            title = recipe.name
            description = recipe.instructions.toNsAttributedString()
            ingredients = recipe.ingredients
            // categories = recipe.category
            selectedDuration = recipe.time
            image = recipe.image
            isEdit = true
        }

        Task {
            let categoriesResult = await firebaseCategoryManager.fetchDataList()
            if let categories = categoriesResult.0 {
                DispatchQueue.main.async { [weak self] in
                    self?.categoryList = categories
                }
            }
        }
    }

//    private func addRecipe() -> Bool {
//        let fileName = UUID().uuidString + "_Local.jpg"
//        if let imageData = pickedImage {
//            let _ = localFileStore.saveImageInDefaultDirectory(imageData: imageData, fileName: fileName) //saveImageToDocumentsDirectory(imageData: imageData) ?? ""
//        }
//
//        let newRecipe = RecipeData(name: title, details: description, ingredients: ingredients, duration: numberOfTime, image: fileName, category: category, id: UUID().uuidString)
//
//        return localFileStore.addRecipe(recipe: newRecipe)
//    }
//
//    private func updateRecipe() -> Bool {
//        let fileName = UUID().uuidString + "_Local.jpg"
//        if let imageData = pickedImage {
//            let _ = localFileStore.saveImageInDefaultDirectory(imageData: imageData, fileName: fileName) //saveImageToDocumentsDirectory(imageData: imageData) ?? ""
//        }
//
//        let newRecipe = RecipeData(name: title, details: description, ingredients: ingredients, duration: numberOfTime, image: fileName, category: category, id: UUID().uuidString)
//
//        let isSuccess = updateRecipe(recipe: newRecipe)
//        return isSuccess
//    }

    func saveData() {
        let (isValid, message) = isValid()

        if isValid == false {
            showAlert = true
            alertMessage = message
            return
        }

        let newRecipe = Recipe(id: UUID().uuidString, name: title, ingredients: ingredients, instructions: description.toHtml() ?? "", image: "", category: catBreakfast, rating: 5.0, time: duration, calories: "100", tags: dummyTags1)

        Task {
            let result = await firebasRecipeManager.addData(recipe: newRecipe)
          //  print("created id is \(String(describing: result.0))  error \(String(describing: result.1?.localizedDescription))")
        }
    }

    private func isValid() -> (Bool, String) {
        return (true, "")
        if title.isEmpty {
            return (false, "Please input title")
        }
        if description.length <= 0 {
            return (false, "Please input description")
        }
        if ingredients.isEmpty {
            return (false, "Please input ingredients")
        }
//        if category.isEmpty {
//            return (false, "Please input category")
//        }
        if selectedDuration == "" {
            return (false, "Please input duration")
        }

        return (true, "")
    }

//    private func saveImageToDocumentsDirectory(imageData: Data) -> String? {
//
//        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
//            return nil
//        }
//
//        // Create a unique file name
//        let fileName = UUID().uuidString + ".jpg"
//        let fileURL = documentsDirectory.appendingPathComponent(fileName)
//
//        do {
//            // Save the image data to the file URL
//            try imageData.write(to: fileURL)
//            print("Image saved to: \(fileURL)")
//            return fileURL.absoluteString
//        } catch {
//            print("Failed to save image: \(error.localizedDescription)")
//            return nil
//        }
//    }
}
