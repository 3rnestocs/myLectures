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
    @IBOutlet weak var firstLineView: UIView!
    @IBOutlet weak var secondButton: MLButton!
    @IBOutlet weak var secondLineView: UIView!
    @IBOutlet weak var thirdButton: MLButton!
    @IBOutlet weak var thirdLineView: UIView!
    @IBOutlet weak var tableContainerView: UIView!
    
    // MARK: - Properties
    var networkingVC: NetworkingTableViewController?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Setup
    private func setupUI() {
        self.setupButtons()
        self.updateTableContainer()
    }

    private func setupHeaderView() {
        
    }

    private func setupButtons() {
        self.firstButton.setTitle("Networking".uppercased(), for: .normal)
        self.firstButton.setImage(nil, for: .selected)
        self.secondButton.setTitle("Control de asistencia".uppercased(), for: .normal)
        self.thirdButton.setTitle("Reconocimiento".uppercased(), for: .normal)
    }

    // MARK: - Helpers
    private func updateTableContainer() {
        self.firstButton.isSelected.toggle()
        if self.firstButton.isSelected {
            if self.networkingVC == nil {
                self.networkingVC = NetworkingTableViewController(nibName: NetworkingTableViewController.identifier, bundle: nil)
            }
            guard let networkingVC = self.networkingVC else { return }
            self.addControllerToContainer(viewController: networkingVC, containerView: self.tableContainerView)
        }
    }

    private func setupCurrentView() {
//        if currentViewButton.isSelected {
//            if self.mapViewController == nil {
//                self.mapViewController = AppStoryboard.main.instance.viewController()
//                self.mapViewController?.delegate = self
//            }
//
//            guard let mapViewController = self.mapViewController else { return }
//
//            currentViewController = mapViewController
//            addControllerToContainer(viewController: mapViewController)
//            NotificationCenter.default.post(name: .shouldCleanDiscoverCollection, object: nil)
//        } else {
//            if self.discoveryViewController == nil {
//                self.discoveryViewController = AppStoryboard.main.instance.viewController()
//            }
//
//            guard let discoveryViewController = self.discoveryViewController else { return }
//
//            currentViewController = discoveryViewController
//            addControllerToContainer(viewController: discoveryViewController)
//        }
    }

    // MARK: - Actions
    @IBAction func firstButtonTouched(_ sender: UIButton) {
        print(sender.isSelected)
    }
    @IBAction func secondButtonTouched(_ sender: UIButton) {
        self.tableContainerView.backgroundColor = .green
    }
    @IBAction func thirdButtonTouched(_ sender: UIButton) {
        self.tableContainerView.backgroundColor = .yellow
    }
}

