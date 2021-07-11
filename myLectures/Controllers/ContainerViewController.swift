//
//  ContainerViewController.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

class ContainerViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var tabBarScrollView: UIScrollView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var firstLineView: UIView!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var secondLineView: UIView!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var thirdLineView: UIView!
    @IBOutlet weak var tableContainerView: UIView!
    
    // MARK: - Properties

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Setup
    private func setupUI() {
        self.setupButtons()
    }

    private func setupButtons() {
        self.firstButton.setTitle("Networking".uppercased(), for: .normal)
        self.secondButton.setTitle("Control de asistencia".uppercased(), for: .normal)
        self.thirdButton.setTitle("Reconocimiento".uppercased(), for: .normal)
    }

    // MARK: - Helpers

    // MARK: - Actions
    @IBAction func firstButtonTouched(_ sender: UIButton) {
    }
    @IBAction func secondButtonTouched(_ sender: UIButton) {
    }
    @IBAction func thirdButtonTouched(_ sender: UIButton) {
    }
}

