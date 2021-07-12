//
//  Extensions.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

extension UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }

    func addControllerToContainer(viewController: UIViewController?, containerView: UIView) {
        if let viewController = viewController {
            addChild(viewController)

            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            viewController.view.frame = containerView.bounds
            containerView.addSubview(viewController.view)
            viewController.didMove(toParent: self)
        }
    }
}

extension DateFormatter {

    static let hourformat: DateFormatter = {
        let jsonDateFormatter = DateFormatter()
        jsonDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        jsonDateFormatter.dateFormat = "hh:mm a"
        return jsonDateFormatter
    }()
}
