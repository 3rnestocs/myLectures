//
//  NetworkingTableViewCell.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

protocol NetworkingTableViewCellDelegate: AnyObject {
    func showDropDown(_ cell: NetworkingTableViewCell)
}

class NetworkingTableViewCell: UITableViewCell {

    // MARK: - Outlet
    @IBOutlet weak var greenBackgroundView: UIView!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dotsButton: UIButton!
    
    // MARK: - Properties
    var currentStatusImage: UIImage?
    weak var delegate: NetworkingTableViewCellDelegate?

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: - Helpers
    private func setupUI() {
        self.selectionStyle = .none
        self.showDefaultState()
    }

    func showSelectedState() {
        self.greenBackgroundView.backgroundColor = UIColor(named: "green")?.withAlphaComponent(0.16)
        self.greenBackgroundView.layer.cornerRadius = self.frame.height / 2.5
        self.statusImageView.image = UIImage(named: "checkCell")
    }

    func showDefaultState() {
        self.greenBackgroundView.backgroundColor = UIColor(named: "bgColor")
        self.greenBackgroundView.layer.cornerRadius = 0
        self.statusImageView.image = self.currentStatusImage
    }
    
    func setupCell(withUser user: User) {
        self.nameLabel.text = user.name
        self.placeLabel.text = user.place
        self.timeLabel.text = user.time
        
        switch user.status {
        case .contact:
            self.statusImageView.image = UIImage(named: "person")
        case .made:
            self.statusImageView.image = UIImage(named: "made")
        case .received:
            self.statusImageView.image = UIImage(named: "received")
        }
        self.currentStatusImage = self.statusImageView.image
    }

    // MARK: - Actions
    @IBAction func dotsButtonTouched(_ sender: UIButton) {
        self.delegate?.showDropDown(self)
    }
}
