//
//  TitleSubtitleCell.swift
//  EventsApp
//
//  Created by Tanaka Mazivanhanga on 11/28/20.
//

import UIKit

class TitleSubtitleCell: UITableViewCell, ProgramaticView, CellView {
    static let cellID = "TitleSubtitleCell"

    private let titleLabel = UILabel()
    let subtitleTextField = UITextField()
    private let vStack = UIStackView()
    private let datePicker = UIDatePicker()
    private var viewModel: TitleSubtitleCellViewModel?
    private lazy var toolBar: UIToolbar   = {
        UIToolbar(frame: .init(x: 0, y: 0, width: contentView.bounds.width, height: 50))
    }()
    private lazy var doneButton:UIBarButtonItem = {

        UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))

    }()

    private let photoImageView = UIImageView()
    private let padding:CGFloat = 15

    func setUpViews() {
        vStack.axis  = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        toolBar.setItems([doneButton], animated: false)
        photoImageView.backgroundColor =  .fromRGB(0, 0, 0, 0.4)
        photoImageView.roundCorners(10)



    }

    func setUpHierachy() {
        contentView.addSubview(vStack)
        let views = [titleLabel, subtitleTextField, photoImageView]
        views.forEach({
            if $0 is UILabel {
                ($0 as! UILabel).font = .systemFont(ofSize: 22, weight: .medium)
            }else if $0 is UITextField{
                ($0 as! UITextField).font = .systemFont(ofSize: 20, weight: .medium)
            }
            vStack.addArrangedSubview($0)
        })




    }

    func setUpLayout() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        vStack.bindFrameToSuperviewBounds(Edge.all, constant: padding)
    }

    func update<T>(with viewModel: T) where T : BaseCellViewModel {
        guard let vm = viewModel as? TitleSubtitleCellViewModel else{return}
        self.viewModel = vm
        selectionStyle = .none
        titleLabel.text = vm.title
        subtitleTextField.text = vm.subtitle
        subtitleTextField.placeholder = vm.placeholder
        subtitleTextField.inputView = vm.type == .date ? datePicker : nil
        subtitleTextField.inputAccessoryView = vm.type == .date  ? toolBar : nil
        photoImageView.isHidden  = vm.type != .image
        subtitleTextField.isHidden = vm.type == .image
        vStack.spacing = vm.type == .image ? 15 : vStack.spacing
        photoImageView.image = vm.image
    }

    //    func update(with viewModel: BaseCellViewModel) {
    //        guard let vm = viewModel as? TitleSubtitleCellViewModel else{return}
    //        titleLabel.text = vm.title
    //        subtitleTextField.placeholder = vm.placeholder
    //
    //    }


    @objc private func  doneButtonTapped(){
        //tell vm that date was updated
        //tell tableView to reeload us
        viewModel?.update(datePicker.date)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpHierachy()
        setUpLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

