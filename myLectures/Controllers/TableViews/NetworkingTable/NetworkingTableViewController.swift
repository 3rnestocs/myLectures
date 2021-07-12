//
//  NetworkingTableViewController.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

class NetworkingTableViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var selectedCells = [NetworkingTableViewCell]()
    var usersArray = [User]()
    
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
        let user1 = User(name: "Ernesto", place: "Canada", time: time, status: .contact)
        let user2 = User(name: "Mervin", place: "Estados Unidos", time: time, status: .received)
        let user3 = User(name: "Naruto", place: "Konoha", time: time, status: .made)
        let user4 = User(name: "Batman", place: "Gotham City", time: time, status: .received)
        let user5 = User(name: "Bad Bunny", place: "Puerto Rico", time: time, status: .made)
        let user6 = User(name: "Rick Sanchez", place: "Todo el universo", time: time, status: .contact)

        self.usersArray = [user1, user2, user3, user4, user5, user6, user1, user2, user3, user4, user5, user6, user3, user4, user5, user6]
        self.tableView.reloadData()
    }
}

extension NetworkingTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NetworkingTableViewCell.cellIdentifier, for: indexPath) as? NetworkingTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(withUser: self.usersArray[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension NetworkingTableViewController: UITableViewDelegate {
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

extension NetworkingTableViewController: NetworkingTableViewCellDelegate {
    func addSelectedCell(_ cell: NetworkingTableViewCell) {
        self.selectedCells.append(cell)
    }
    
    func removeSelectedCell(_ cell: NetworkingTableViewCell) {
        if let index = self.selectedCells.firstIndex(of: cell) {
            self.selectedCells.remove(at: index)
        }
    }
}
