//
//  Date+Extensions.swift
//  CoreData-1
//
//  Created by Field Employee on 2/24/21.
//

import Foundation

extension Date {
    func toString (format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
