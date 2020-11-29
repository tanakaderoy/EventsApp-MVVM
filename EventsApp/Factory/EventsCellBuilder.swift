//
//  EventsCellBuilder.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/29/20.
//

import Foundation


struct EventsCellBuilder {
     func makeTitleSubtitleCellViewModel(_ type:  CellType, onCellUpdate: @escaping ()->() = {}) -> TitleSubtitleCellViewModel{
        switch type {
        case .date:
            return  .init(title: "Date", subtitle: "", placeholder: "Enter a Date", type: .date, onCellUpdate:  onCellUpdate)
        case.image:
            return .init(title: "Background", subtitle: "", placeholder: "", type: .image, onCellUpdate: onCellUpdate)
        case.text:
            return .init(title: "Name", subtitle: "", placeholder: "Enter a Name", type: .text)
        }
    }
}
