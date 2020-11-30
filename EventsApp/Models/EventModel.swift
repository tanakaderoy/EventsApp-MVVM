//
//  EventModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import Foundation
import UIKit


struct EventModel {
    let name: String
    let date:Date
    let image: Data

    init(name: String, date:Date, image: UIImage){
        self.name = name
        self.date = date
        let resizedImage = image.sameAspectRatio(newHeight: 250)
        guard let img = resizedImage.jpegData(compressionQuality: 0.5) else {
            self.image = Data()
            return
        }
        self.image = img
    }
}
