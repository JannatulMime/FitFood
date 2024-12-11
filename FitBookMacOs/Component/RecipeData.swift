//
//  RecipeData.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 11/12/24.
//

import Foundation

struct RecipeData: Identifiable {
    var name: String
    var details: NSAttributedString
    var ingredients: String
    var duration: String
    var image: String?
    var category: String
    var id: String = UUID().uuidString

    func getFormatedDuration() -> String {
        guard let timeInInt = duration.toInt() else {
            return "N/A"
        }

        return timeInInt.toFormatedHourMinuteText()
    }

    func getImageData() -> Data? {
        if let fileName = image {
            return LocalFileStore.getDataFrom(fileName: fileName)
        }
        return nil
    }
}


extension Int {
    func toFormatedHourMinuteText() -> String {
        let hours = self / 60
        let minutes = self % 60

        let timeString = String(format: "%02dH:%02dM", hours, minutes)
        return timeString
    }
}
