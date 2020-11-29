//
//  TitleSubtitleCellViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import Foundation


class TitleSubtitleCellViewModel: TitleSubtitleCellViewModelProtocol {
    init(title: String, subtitle: String, placeholder: String, type: CellType, onCellUpdate: @escaping() -> () = {}) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
        self.type = type
        self.onUpdate = onCellUpdate
    }





    var title: String
    var subtitle:String
    var placeholder: String
    var type:  CellType

    var onUpdate: () -> ()




    func update(_ subtitle: String){
        self.subtitle = subtitle
    }

    func update(_ date: Date){
        guard type == .date else {return}
        subtitle = date.toFormmattedString("MM.dd.yyy")
        //reload cell
        onUpdate()
        
    }





}


enum CellType {
    case text, date, image
}
