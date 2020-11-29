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
    var onCellUpdate: ()->() {get set}
    var title: String {get set}
    var subtitle:String {get set}
    var placeholder: String {get set}
    var type:  CellType  {get set}
    var image: UIImage?  {get set}
}


protocol TableViewViewModel {
    func numberOfRowsin(_ section: Int) -> Int
    func cellForRowAtIndexPath(_ indexPath:IndexPath) -> BaseCell
}

protocol AddEventViewViewModel: TableViewViewModel {
    var title: String {get set}
    var onUpdate:  ()->(){get set}
    var coordinator: ChildCoordinatorWithLifeCycle? {get set}
    func tappedDone()
    var cells: [AddEventCell] {get set}
    var cellBuilder:EventsCellBuilder {get set}
    var coreDataManager: CoreDataManager {get set}
}

protocol ChildCoordinatorWithLifeCycle: ChildCoordinator, CoordinatorWithLifeCycle {
}

protocol ParentCoordinatorWithLifeCycle: ParentCoordinator, CoordinatorWithLifeCycle {
}

protocol CoordinatorWithLifeCycle: Coordinator {
    func didFinish()
}

protocol ChildParentCoordinatorWithLifeCycle: ChildCoordinatorWithLifeCycle,  ParentCoordinator {
}


protocol ChildCoordinator: Coordinator {
    var parentCoordinator: ParentCoordinator? {get set}

}

protocol BaseCell {
    
}

//Refactor
enum AddEventCell: BaseCell {
    case titleSubtitle(TitleSubtitleCellViewModel)
}

