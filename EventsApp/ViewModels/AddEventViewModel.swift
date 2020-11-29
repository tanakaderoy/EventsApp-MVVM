//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit
class AddEventViewModel: AddEventViewViewModel{
    
    var cells: [AddEventCell] = []
    func numberOfRowsin(_ section: Int = 1) -> Int {
        cells.count
    }

    func cellForRowAtIndexPath(_ indexPath: IndexPath) -> BaseCell {
        let cell  = cells[indexPath.row]
        return cell
    }


    init() {}
    func viewDidDisappear() {
        coordinator?.didFinish()
    }

    func viewDidLoad() {
        cells = [
            .titleSubtitle(.init(title: "Name", subtitle: "", placeholder: "Enter a Name", type: .text)),
            .titleSubtitle(.init(title: "Date", subtitle: "", placeholder: "Enter a Date", type: .date, onCellUpdate: { [weak self] in
                self?.onUpdate()

            }))
            ,.titleSubtitle(.init(title: "Background", subtitle: "", placeholder: "", type: .image, onCellUpdate: {}))
        ]

        onUpdate()
    }

    //Potentially Extract to protocol
    var title = "Add"
    var onUpdate:  ()->()  =  {}

    weak var coordinator: ChildCoordinator?

    func tappedDone() {

    }

    func updateCell(forCellAt indexPath:IndexPath, subtitle: String){
        switch cells[indexPath.row]{
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
        }
    }



}


