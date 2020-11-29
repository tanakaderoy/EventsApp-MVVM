//
//  EventCell.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/29/20.
//

import UIKit

class EventCell: UITableViewCell, ProgramaticView, CellView {
    static let cellID = "EventListCell"
    let nameLabel = UILabel()
    let vStack = UIStackView()
    let yearLabel = UILabel()
    let monthLabel = UILabel()

    let weeksLabel = UILabel()

    let daysLabel = UILabel()

    let dateLabel = UILabel()
    let backgroundImageView  = UIImageView()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpHierachy()
        setUpLayout()
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpViews() {
        vStack.axis  = .vertical
        vStack.alignment = .trailing
        [yearLabel,monthLabel,weeksLabel,daysLabel,dateLabel].forEach({$0.font =  .systemFont(ofSize: 22, weight: .medium)
            $0.textColor  =  .white
        })
        nameLabel.font = .systemFont(ofSize: 28, weight: .bold)
        nameLabel.textColor = .white
    }

    func setUpHierachy() {
let v = UIView()
        contentView.addSubview(v)
        v.bindFrameToSuperviewBounds(Edge.all,  constant: 16)

        v.addSubview(backgroundImageView)
        v.roundCorners(10)
        v.elevate(elevation: 10)
        v.addSubview(vStack)
        [yearLabel,monthLabel].forEach({
            vStack.addArrangedSubview($0)
        })
        vStack.addArrangedSubview(UIView())
        vStack.addArrangedSubview(dateLabel)
        v.addSubview(nameLabel)
    }
    
    func setUpLayout() {

        backgroundImageView.bindFrameToSuperviewBounds([.left,.top,.right])
        let bottomConstraint = backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .required - 1
        bottomConstraint.isActive = true

        backgroundImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        vStack.bindFrameToSuperviewBounds([.top,.right], constant: 16)
        vStack.bindFrameToSuperviewBounds([.bottom],  constant: 8)
        nameLabel.bindFrameToSuperviewBounds([.left], constant: 15)
        nameLabel.bindFrameToSuperviewBounds([.bottom], constant: 8)

    }

    func update<T>(with viewModel: T) where T : BaseCellViewModel {
        guard let viewModel = viewModel as? EventCellViewModel else  {return}
        [yearLabel,monthLabel,weeksLabel,daysLabel].forEach({
            $0.text = "! Jan Mon"
        })
        dateLabel.text = viewModel.date
        nameLabel.text = viewModel.name
        backgroundImageView.image = viewModel.image
    }
}
