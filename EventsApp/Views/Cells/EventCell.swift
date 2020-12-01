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
    let containerView = UIView()
    let vStack = UIStackView()
    let timeRemainingStackView = TimeRemainingStackView()

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
        timeRemainingStackView.setup()
        vStack.axis  = .vertical
        vStack.alignment = .trailing
        dateLabel.font =  .systemFont(ofSize: 22, weight: .medium)
        dateLabel.textColor  =  .white
        nameLabel.font = .systemFont(ofSize: 28, weight: .bold)
        nameLabel.textColor = .white
        backgroundImageView.blurBackground(style: .light, alpha: 0.2)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds  = true
    }

    func setUpHierachy() {
        contentView.addSubview(containerView)
        containerView.bindFrameToSuperviewBounds(Edge.all,  constant: 16)

        containerView.addSubview(backgroundImageView)
        containerView.roundCorners(10)
        containerView.elevate(elevation: 10)
        containerView.addSubview(vStack)
        vStack.addArrangedSubview(timeRemainingStackView)
        vStack.addArrangedSubview(UIView())
        vStack.addArrangedSubview(dateLabel)
        containerView.addSubview(nameLabel)
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
        timeRemainingStackView.update(with: viewModel.timeRemainingViewModel)
        dateLabel.text = viewModel.date
        nameLabel.text = viewModel.name
        viewModel.loadImage {[weak self] (img) in
            self?.backgroundImageView.image = img
        }
    }
}
