//
//  NetworkingTableViewController.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit
import DropDown

protocol NetworkingTableViewControllerDelegate: AnyObject {
    func shareSelectedCells(_ indexArray: [IndexPath])
}

class NetworkingTableViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var selectedCells = [IndexPath]()
    weak var delegate: NetworkingTableViewControllerDelegate?
    var usersArray: [User]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    private var dropDown: DropDown = {
        let dropDown = DropDown()
        dropDown.dismissMode = .onTap
        dropDown.direction = .top
        dropDown.cellHeight = 36
        dropDown.backgroundColor = .white
        return dropDown
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTable()
        self.fillUserArray()
    }
    
    // MARK: - Setup
    private func setupTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: NetworkingTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: NetworkingTableViewCell.cellIdentifier)
    }
    
    private func fillUserArray() {
        let time = DateFormatter.hourformat.string(from: Date())
        let user1 = User(name: "Ernesto", place: "Canada", time: time, status: .contact, isSelected: false)
        let user2 = User(name: "Mervin", place: "Estados Unidos", time: time, status: .received, isSelected: false)
        let user3 = User(name: "Naruto", place: "Konoha", time: time, status: .made, isSelected: false)
        let user4 = User(name: "Batman", place: "Gotham City", time: time, status: .received, isSelected: false)
        let user5 = User(name: "Bad Bunny", place: "Puerto Rico", time: time, status: .made, isSelected: false)
        let user6 = User(name: "Rick Sanchez", place: "Todo el universo", time: time, status: .contact, isSelected: false)
        
        self.usersArray = [user1, user2, user3, user4, user5, user6, user1, user2, user3, user4, user5, user6, user3, user4, user5, user6]
    }
    
    private func configureDropDown(aboveCell cell: NetworkingTableViewCell) {
        dropDown.anchorView = cell.dotsButton
        dropDown.dataSource = ["Agregar a Contactos", "Llamar"]
        dropDown.width = cell.frame.width / 2
        dropDown.topOffset = CGPoint(x: -176, y: -cell.dotsButton.frame.height)
        dropDown.show()
        
        dropDown.selectionAction = { (index: Int, item: String) in
            /// This is used to handle DropDown items selection
        }
    }
}

extension NetworkingTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NetworkingTableViewCell.cellIdentifier, for: indexPath) as? NetworkingTableViewCell,
              let user = self.usersArray?[indexPath.row] as User? else {
            return UITableViewCell()
        }
        cell.setupCell(withUser: user)
        cell.delegate = self
        
        if self.selectedCells.contains(indexPath) {
            if user.isSelected {
                cell.showSelectedState()
            } else {
                cell.showDefaultState()
            }
        } else {
            cell.showDefaultState()
        }
        
        return cell
    }
}

extension NetworkingTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.usersArray![indexPath.row].isSelected.toggle()
        if self.usersArray![indexPath.row].isSelected {
            self.selectedCells.append(indexPath)
        } else {
            if let position = self.selectedCells.firstIndex(of: indexPath) {
                self.selectedCells.remove(at: position)
            }
        }
        self.delegate?.shareSelectedCells(self.selectedCells)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
}

extension NetworkingTableViewController: NetworkingTableViewCellDelegate, SelectedHeaderViewDelegate {
    func showDropDown(_ cell: NetworkingTableViewCell) {
        self.configureDropDown(aboveCell: cell)
    }

    func removeAll() {
        /// Delegate to remove all entries
    }
    
    func deleteEntry() {
        /// Delete a single entry
    }
    
    func addEntry() {
        /// Add a single entry
    }
    
    func shareEntry() {
        /// Share a single entry
    }
    
}
