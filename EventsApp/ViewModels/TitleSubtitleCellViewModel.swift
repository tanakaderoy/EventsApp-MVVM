//
//  TitleSubtitleCellViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import Foundation
import UIKit


class TitleSubtitleCellViewModel: TitleSubtitleCellViewModelProtocol {
    init(title: String, subtitle: String, placeholder: String, type: CellType, onCellUpdate: @escaping() -> () = {}) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
        self.type = type
        self.onCellUpdate = onCellUpdate
        
    }





    var title: String
    var subtitle:String
    var placeholder: String
    var type:  CellType
    var image: UIImage?

    var onCellUpdate: () -> ()




    func update(_ subtitle: String){
        self.subtitle = subtitle
    }

    func update(_ date: Date){
        guard type == .date else {return}
        subtitle = date.toFormattedString("MM.dd.yyy")
        //reload cell
        onCellUpdate()
        
    }

    func update(_ image: UIImage){
        self.image = image
        self.onCellUpdate()
    }




}


enum CellType {
    case text, date, image
}
