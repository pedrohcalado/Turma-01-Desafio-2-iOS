//
//  DateFormatter.swift
//  Desafio 2
//
//  Created by Pedro Henrique Calado on 16/12/21.
//

import Foundation

struct FormatDate {
    static func formatStringDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let newDate = dateFormatter.date(from: date)
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        return dateFormatter.string(from: newDate!)
    }
}
