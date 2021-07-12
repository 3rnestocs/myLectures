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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTable()
    }

    // MARK: - Setup
    private func setupTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: NetworkingTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: NetworkingTableViewCell.cellIdentifier)
    }

    private func setupHeaderView() {
        
    }
}

extension NetworkingTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NetworkingTableViewCell.cellIdentifier, for: indexPath) as? NetworkingTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = indexPath.row % 2 == 0 ? .red : .blue
        return cell
    }
}

extension NetworkingTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
