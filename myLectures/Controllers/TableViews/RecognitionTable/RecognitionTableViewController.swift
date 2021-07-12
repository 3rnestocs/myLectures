//
//  RecognitionTableViewController.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/11/21.
//

import UIKit

class RecognitionTableViewController: UIViewController {

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
        self.tableView.register(UINib(nibName: RecognitionTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: RecognitionTableViewCell.cellIdentifier)
    }

    private func setupHeaderView() {
        
    }
}

extension RecognitionTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecognitionTableViewCell.cellIdentifier, for: indexPath) as? RecognitionTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = indexPath.row % 2 == 0 ? .orange : .purple
        return cell
    }
}

extension RecognitionTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
