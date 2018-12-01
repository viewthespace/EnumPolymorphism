//
//  ViewController.swift
//  EnumPolymorphism
//
//  Created by Alex Weisberger on 12/1/18.
//  Copyright © 2018 vts. All rights reserved.
//

import UIKit

enum CellType: Int, CaseIterable {
    case blog
    case video
    case ad
}

class ViewController: UIViewController {

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellType.allCases.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var description: String
        switch CellType(rawValue: indexPath.row)! {
        case .blog:
            description = "This is a blog post"
        case .video:
            description = "This is a video"
        case .ad:
            description = "This is an ad"
        }
        cell.textLabel?.text = description
        return cell
    }
}

