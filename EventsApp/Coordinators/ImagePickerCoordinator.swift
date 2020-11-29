//
//  ImagePickerCoordinator.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/29/20.
//

import UIKit

class ImagePickerCoordinator: NSObject, ChildCoordinatorWithLifeCycle {
    var parentCoordinator: ParentCoordinator?
    let navController: UINavigationController
    init(navController: UINavigationController){
        self.navController = navController
    }
    func didFinish() {

    }

    var childCordinators: [Coordinator] = []

    func start() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate =  self
        navController.present(imagePickerController, animated: true, completion: nil)
    }


}


extension ImagePickerCoordinator: UIImagePickerControllerDelegate,  UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage, let parent = parentCoordinator as? AddEventCoordinator{
            parent.didFinishPicking(image)
        }
        parentCoordinator?.childDidFinish(self)
    }
}
