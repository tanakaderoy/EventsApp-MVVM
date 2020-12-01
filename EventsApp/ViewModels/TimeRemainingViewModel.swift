//
//  TimeRemainingViewModel.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 12/1/20.
//

import UIKit

class TimeRemainingViewModel {
    enum Mode  {
        case cell,detail
    }

    var fontSize:CGFloat {
        switch mode {
        case .detail:
            return 60
        case .cell:
            return 25
        }
    }

    var alignment: UIStackView.Alignment {
        switch mode {
        case .cell:
            return .trailing
        case .detail:
            return .center
        }
    }

    init(timeRemainingParts: [String], mode: Mode) {
        self.timeRemainingParts = timeRemainingParts
        self.mode = mode
    }

    var timeRemainingParts:[String]

    private var mode:Mode

}
