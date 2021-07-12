//
//  ContainerViewController.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

class ContainerViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var headerContainerView: MyLecturesView!
    @IBOutlet weak var tabBarScrollView: UIScrollView!
    @IBOutlet weak var firstButton: MLButton!
    @IBOutlet weak var firstLineView: MLLineView!
    @IBOutlet weak var secondButton: MLButton!
    @IBOutlet weak var secondLineView: MLLineView!
    @IBOutlet weak var thirdButton: MLButton!
    @IBOutlet weak var thirdLineView: MLLineView!
    @IBOutlet weak var tableContainerView: UIView!
    
    // MARK: - Properties
    var currentViewController: UIViewController?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Setup
    private func setupUI() {
        self.setupButtons()
        self.showNetworkingViewController()
    }

    private func setupButtons() {
        self.firstButton.setTitle("Networking".uppercased(), for: .normal)
        self.secondButton.setTitle("Control de asistencia".uppercased(), for: .normal)
        self.thirdButton.setTitle("Reconocimiento".uppercased(), for: .normal)
    }

    // MARK: - Helpers
    private func showNetworkingViewController() {
        if let networkingVC = NetworkingTableViewController(nibName: NetworkingTableViewController.identifier, bundle: nil) as NetworkingTableViewController? {
            self.currentViewController = networkingVC
            self.addControllerToContainer(viewController: self.currentViewController, containerView: self.tableContainerView)
        }
    }

    private func showRecognitionViewController() {
        if let recognitionVC = RecognitionTableViewController(nibName: RecognitionTableViewController.identifier, bundle: nil) as RecognitionTableViewController? {
            self.currentViewController = recognitionVC
            self.addControllerToContainer(viewController: self.currentViewController, containerView: self.tableContainerView)
        }
    }

    private func showControlViewController() {
        if let controlVC = ControlTableViewController(nibName: ControlTableViewController.identifier, bundle: nil) as ControlTableViewController? {
            self.currentViewController = controlVC
            self.addControllerToContainer(viewController: self.currentViewController, containerView: self.tableContainerView)
        }
    }

    private func clearCurrentViewController() {
        self.currentViewController!.view.removeFromSuperview()
        self.currentViewController!.removeFromParent()
        self.firstLineView.selectedState = false
        self.secondLineView.selectedState = false
        self.thirdLineView.selectedState = false
    }

    // MARK: - Actions
    @IBAction func firstButtonTouched(_ sender: UIButton) {
        self.clearCurrentViewController()
        self.showNetworkingViewController()
        self.firstLineView.selectedState = true
    }
    @IBAction func secondButtonTouched(_ sender: UIButton) {
        self.clearCurrentViewController()
        self.showControlViewController()
        self.secondLineView.selectedState = true
    }
    @IBAction func thirdButtonTouched(_ sender: UIButton) {
        self.clearCurrentViewController()
        self.showRecognitionViewController()
        self.thirdLineView.selectedState = true
    }
}

