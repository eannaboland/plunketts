//
//  ViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 29/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation
//
//  ViewController.swift
//  ElongationPreviewDemo
//
//  Created by Abdurahim Jauzee on 08/02/2017.
//  Copyright © 2017 Ramotion. All rights reserved.
//

import UIKit
import ElongationPreview


class ViewController: ElongationViewController {
    
    var datasource: [DynamicEvent] = DynamicEvent.testData
    
    // MARK: Lifecycle 🌎
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func openDetailView(for indexPath: IndexPath) {
        let id = String(describing: DetailViewController.self)
        guard let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id) as? DetailViewController else { return }
        let event = datasource[indexPath.row]
        detailViewController.title = event.title
        expand(viewController: detailViewController)
    }
    
}

// MARK: - Setup ⛏
private extension ViewController {
    
    func setup() {
        tableView.backgroundColor = UIColor.black
        tableView.registerNib(DemoElongationCell.self)
    }
    
}

// MARK: - TableView 📚
extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(DemoElongationCell.self)
        

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        super.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
        guard let cell = cell as? DemoElongationCell else { return }
        
        let event = datasource[indexPath.row]
        
        
        let attributEventTitle = NSMutableAttributedString(string: event.eventTitle.uppercased(), attributes: [
            NSFontAttributeName: UIFont.robotoFont(ofSize: 22, weight: .medium),
            NSKernAttributeName: 8.2,
            NSForegroundColorAttributeName: UIColor.white
            ])
        
        let eventImages = UIImage(named: datasource[indexPath.row].eventTitle)
        cell.topImageView?.image = eventImages
        //cell.topImageView?.image = UIImage(named: event.imageName)
        cell.eventLabel?.attributedText = attributEventTitle
        cell.countryLabel?.text = event.country
        cell.aboutTitleLabel?.text = event.title
        cell.aboutDescriptionLabel?.text = event.description
    }
    
}
