//
//  AddEventCoordinator.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

class AddEventCoordinator: ChildParentCoordinatorWithLifeCycle {


    var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController
    private var modalNavVC: UINavigationController?
    private var completion:  UIImageCompletion =  { _ in }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    private(set) var  childCordinators: [Coordinator] = []

    func start() {
        //create add vc and vm and present modally
        let cellBuilder =   EventsCellBuilder()
        let addEventVM = AddEventViewModel(cellBuilder:  cellBuilder, coreDataManager: CoreDataManager.shared)
        addEventVM.coordinator = self
        let vc : AddEventViewController = .instantiate()
        vc.vm = addEventVM
        modalNavVC = UINavigationController(rootViewController: vc)
        if let modalNavVC = modalNavVC{
            navigationController.present(modalNavVC, animated: true, completion: nil)
        }
    }
    func didFinish(){
        parentCoordinator?.childDidFinish(self)
    }

    func didFinishSaveEvent(){
        ( parentCoordinator as? EventListCoordinator)?.onSaveEvent()
        navigationController.dismiss(animated: true, completion: nil)
    }

    func showImagePicker(_ completion:  @escaping UIImageCompletion){
        guard let modalNavVC = modalNavVC else {return}
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: modalNavVC)
        self.completion = completion
        imagePickerCoordinator.parentCoordinator = self
        childCordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
    }

    func didFinishPicking(_ image: UIImage){
        //tell vm we is done and update view
        completion(image)
        modalNavVC?.dismiss(animated: true, completion: nil)
    }

    func childDidFinish(_ coordinator: Coordinator) {
        guard let index = childCordinators.firstIndex(where: {coordinator === $0}) else {return}
        childCordinators.remove(at: index)
    }
}

typealias UIImageCompletion = (UIImage)->()
