//
//  MyLecturesView.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

class MyLecturesView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var myLecturesLabel: UILabel!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    // MARK: - Helpers
    private func initialize() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(self.contentView)
        self.backgroundColor = .clear
        self.contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.myLecturesLabel.text = "Mis lecturas".capitalized
    }
}
