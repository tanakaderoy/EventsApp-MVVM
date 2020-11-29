//
//  Date+Extensions.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/29/20.
//

import Foundation

extension Date {
    static func fromString(isoDate:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from:isoDate)
    }

    static func fromString(_ stringDate:String,with format:String = "MM.dd.yyy") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = format
        return dateFormatter.date(from:stringDate)
    }

    func toFormattedString(_ format:String = "EEEE, MMM d, yyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
