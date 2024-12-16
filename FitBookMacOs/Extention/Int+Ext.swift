//
//  Int+Ext.swift
//  FitBookMacOs
//
//  Created by Habibur Rahman on 14/12/24.
//

import Foundation

extension Int {
    func toFormatedHourMinuteText() -> String {
        let hours = self / 60
        let minutes = self % 60

        let timeString = String(format: "%02dH:%02dM", hours, minutes)
        return timeString
    }
}
