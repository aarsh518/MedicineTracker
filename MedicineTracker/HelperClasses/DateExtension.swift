//
//  DateExtension.swift
//  MedicineTracker
//
//  Created by Aarsh Parekh on 07/08/20.
//  Copyright © 2020 Aarsh. All rights reserved.
//

import Foundation

extension Date {
    
    private enum Formater: String {
        case ddMMYYYY = "dd-MM-YYY"
    }
    
    func convertToDDMMYYYStringFormat() -> String {
        return getDateInStringFormat(withFormaterString: Formater.ddMMYYYY.rawValue)
    }
    
    private func getDateInStringFormat(withFormaterString formater: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formater
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: Date())
    }
}
