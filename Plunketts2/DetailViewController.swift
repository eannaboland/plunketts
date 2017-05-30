//
//  DetailViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 29/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation
import ElongationPreview


class DetailViewController: ElongationDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        tableView.separatorStyle  = .none
        tableView.registerNib(GridViewCell.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(GridViewCell.self)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let appearance = ElongationConfig.shared
        let headerHeight = appearance.topViewHeight + appearance.bottomViewHeight
        let screenHeight = UIScreen.main.bounds.height
        return screenHeight - headerHeight
    }
    
}
