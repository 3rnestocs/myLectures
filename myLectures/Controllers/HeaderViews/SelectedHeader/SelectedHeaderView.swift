//
//  SelectedHeaderView.swift
//  myLectures
//
//  Created by Ernesto Jose Contreras Lopez on 7/12/21.
//

import UIKit

protocol SelectedHeaderViewDelegate: AnyObject {
    func removeAll()
    func deleteEntry()
    func addEntry()
    func shareEntry()
}

class SelectedHeaderView: UIView {
    
    // MARK: - Outlet
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var removeAllButton: UIButton!
    @IBOutlet weak var itemNumberLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    weak var delegate: SelectedHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateView(_ :)), name: .didSelectCells, object: nil)
    }
    
    // MARK: - Helpers
    private func initialize() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addSubview(self.contentView)
        self.backgroundColor = .clear
        self.contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setupObserver()
    }
    
    @IBAction func removeAllButtonTouched(_ sender: UIButton) {
        self.delegate?.removeAll()
    }
    
    @IBAction func deleteButtonTouched(_ sender: UIButton) {
        self.delegate?.deleteEntry()
    }
    
    @IBAction func addButtonTouched(_ sender: UIButton) {
        self.delegate?.addEntry()
    }
    
    @IBAction func shareButtonTouched(_ sender: UIButton) {
        self.delegate?.shareEntry()
    }
    
    @objc private func updateView(_ notification: Notification) {
        guard let items = notification.object as? Int else { return }
        if items == 1 {
            self.itemNumberLabel.text = "\(items) item"
        } else {
            self.itemNumberLabel.text = "\(items) items"
        }
    }
}
