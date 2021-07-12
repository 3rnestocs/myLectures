//
//  ControlTableViewController.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

class ControlTableViewController: UIViewController {

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
        self.tableView.register(UINib(nibName: ControlTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: ControlTableViewCell.cellIdentifier)
    }

    private func setupHeaderView() {
        
    }
}

extension ControlTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ControlTableViewCell.cellIdentifier, for: indexPath) as? ControlTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = indexPath.row % 2 == 0 ? .brown : .magenta
        return cell
    }
}

extension ControlTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
