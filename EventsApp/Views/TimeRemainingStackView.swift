//
//  TimeRemainingStackView.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 12/1/20.
//

import UIKit

class TimeRemainingStackView: UIStackView {
    private let timeRemainingLabels = [UILabel(), UILabel(), UILabel(), UILabel()]

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    func setup() {
        axis = .vertical
        timeRemainingLabels.forEach({
            addArrangedSubview($0)
        })
    }

    func update(with viewModel: TimeRemainingViewModel?){
        guard let viewModel = viewModel  else {return}
        timeRemainingLabels.forEach({
            $0.text = ""
            $0.font = .systemFont(ofSize: viewModel.fontSize, weight: .medium)
            $0.textColor = .white
        })
        viewModel.timeRemainingParts.enumerated().forEach({
            timeRemainingLabels[$0.offset].text = $0.element
        })

        alignment = viewModel.alignment
    }
}
