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

    init(cellBuilder:EventsCellBuilder, coreDataManager: CoreDataManager) {
        self.cellBuilder = cellBuilder
        self.coreDataManager = coreDataManager
    }
    func viewDidDisappear() {
        coordinator?.didFinish()
    }


    private var nameCellViewModel: TitleSubtitleCellViewModel?
    private var dateCellViewModel: TitleSubtitleCellViewModel?
    private var imageCellViewModel: TitleSubtitleCellViewModel?


    func viewDidLoad() {
        setUpCells()
        onUpdate()
    }

    var cellBuilder:EventsCellBuilder
    var title = "Add"
    var onUpdate:  ()->()  =  {}
    var coreDataManager: CoreDataManager

    weak var coordinator: ChildCoordinatorWithLifeCycle?

    func tappedDone() {
        guard let name = nameCellViewModel?.subtitle,
              let dateText  = dateCellViewModel?.subtitle,
              let date = Date.fromString(dateText),
              let image = imageCellViewModel?.image
        else {return}
        coreDataManager.saveEvent(currEvent: .init(name:name , date: date, image: image))   
        (coordinator as? AddEventCoordinator)?.didFinishSaveEvent()
    }

    func updateCell(forCellAt indexPath:IndexPath, subtitle: String){
        switch cells[indexPath.row]{
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
        }
    }

    func didSelectRow(at indexPath:IndexPath) {
        switch cells [indexPath.row]{
        case .titleSubtitle(let titleSubtitleCellViewModel):
            guard titleSubtitleCellViewModel.type == .image, let coordinator = coordinator as? AddEventCoordinator else{return}
            coordinator.showImagePicker(){ image in
                titleSubtitleCellViewModel.update(image)
            }
        }
    }


}


private extension AddEventViewModel {
    private func setUpCells() {
        nameCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.text)
        dateCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.date){ [weak self] in
            self?.onUpdate()
        }
        imageCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.image) { [weak self]  in
            self?.onUpdate()
        }

        guard let nameCellViewModel = nameCellViewModel, let imageCellViewModel = imageCellViewModel, let dateCellViewModel = dateCellViewModel else {return}

        cells = [
            .titleSubtitle(nameCellViewModel),
            .titleSubtitle(dateCellViewModel)
            ,.titleSubtitle(imageCellViewModel)
        ]
    }
}

