//
//  Protocols.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import Foundation
import UIKit




protocol ProgramaticView {
    func setUpViews()
    func setUpHierachy()
    func setUpLayout()
}

protocol Coordinator: class {
    var childCordinators: [Coordinator] {get}
    func  start()
}

protocol ParentCoordinator: Coordinator {
    func childDidFinish(_ coordinator: Coordinator)
}

protocol CellView:class {
    func update<T: BaseCellViewModel>(with viewModel: T)
}

protocol BaseCellViewModel:class{

}
protocol TitleSubtitleCellViewModelProtocol: BaseCellViewModel {
    var onUpdate: ()->() {get set}
    var title: String {get set}
    var subtitle:String {get set}
    var placeholder: String {get set}
    var type:  CellType  {get set}
}


protocol TableViewViewModel {
    func numberOfRowsin(_ section: Int) -> Int
    func cellForRowAtIndexPath(_ indexPath:IndexPath) -> BaseCell
}

protocol AddEventViewViewModel: TableViewViewModel {
    var title: String {get set}
    var onUpdate:  ()->(){get set}
    var coordinator: ChildCoordinator? {get set}
    func tappedDone()
    var cells: [AddEventCell] {get set}
}

protocol ChildCoordinator: Coordinator {
    var parentCoordinator: ParentCoordinator? {get set}
    func didFinish()
}

protocol BaseCell {
    
}

//Refactor
enum AddEventCell: BaseCell {
    case titleSubtitle(TitleSubtitleCellViewModel)
}

