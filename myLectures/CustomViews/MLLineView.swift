//
//  MLLineView.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

class MLLineView: UIView {
    // MARK: - Properties
    var selectedState: Bool {
        didSet {
            self.backgroundColor = selectedState ? UIColor(named: "green") : .white
        }
    }
    
    // MARK: - Init
    init(state: Bool) {
        self.selectedState = state
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        self.selectedState = false
        super.init(coder: aDecoder)
    }
}
