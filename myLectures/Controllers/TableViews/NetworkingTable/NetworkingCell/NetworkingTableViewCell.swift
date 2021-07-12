//
//  NetworkingTableViewCell.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

class NetworkingTableViewCell: UITableViewCell {

    // MARK: - Outlet
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dotsButton: UIButton!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: - Helpers
    private func setupUI() {
        self.backgroundColor = UIColor(named: "bgColor")
        self.selectionStyle = .none
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
    }

    // MARK: - Actions
    @IBAction func dotsButtonTouched(_ sender: UIButton) {
        print("Attempting to add dropmenu")
    }
}
