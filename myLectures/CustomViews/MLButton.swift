//
//  MLButton.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

class MLButton: UIButton {
    override var isSelected: Bool {
        didSet {
            self.tintColor = .clear
        }
    }

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Setup
    private func setup() {
        self.setTitleColor(.black, for: .selected)
    }
}
