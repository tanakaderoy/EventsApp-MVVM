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

protocol EventCellModel: BaseCellViewModel {
//    var onTap: ()->() {get set}
    var name: String {get}
    var timeRemainingString: [String] {get}
    var date: String {get}
//    var image: UIImage? {get}
    var event: Event {get  set}
    var onCellUpdate: ()->() {get set}
    func loadImage(completion: @escaping UIImageCompletion)
}


protocol TableViewViewModel {
    var onUpdate:  ()->(){get set}
    func numberOfRowsin(_ section: Int) -> Int
    func cellForRowAtIndexPath(_ indexPath:IndexPath) -> BaseCell
}

protocol AddEventViewViewModel: TableViewViewModel {
    var title: String {get set}
    var coordinator: ChildCoordinatorWithLifeCycle? {get set}
    func tappedDone()
    var cells: [AddEventCell] {get set}
    var cellBuilder:EventsCellBuilder {get set}
    var coreDataManager: CoreDataManager {get set}
}

protocol EventListViewViewModel: TableViewViewModel {
    var coordinator: EventListCoordinator? {get set}
    var title:String {get}
    var cells: [EventListCell] {get set}
    var coreDataManager: CoreDataManager {get set}
    func viewDidLoad()
func reloadData()

    func tappedAddEvent()
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

enum EventListCell: BaseCell {
    case eventCell(EventCellViewModel)
}




 protocol ElevatableView {
    func elevate(elevation: Double)
}

 extension ElevatableView where Self: UIView {
    func elevate(elevation: Double) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero//CGSize(width: 0, height: elevation)
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.shadowRadius = elevation > 0.0 ?  CGFloat(elevation) : -CGFloat(elevation)
        self.layer.shadowOpacity = 0.5
    }
}
