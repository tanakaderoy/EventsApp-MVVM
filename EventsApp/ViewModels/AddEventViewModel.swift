//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import Foundation
class AddEventViewModel{

    weak var coordinator: ChildCoordinator?
  

    init() {}

    func viewDidDisappear() {
        coordinator?.didFinish()
    }
    let title = "AddEvent"

    
}
