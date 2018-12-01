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

protocol Cell {
    var description: String { get }
    func onSelection()
}

struct CellFactory {
    static func createCell(fromIndexPath indexPath: IndexPath) -> Cell {
        switch CellType(rawValue: indexPath.row)! {
        case .blog:
            return BlogCell()
        case .video:
            return VideoCell()
        case .ad:
            return AdCell()
        }
    }
}

struct BlogCell: Cell {
    var description: String {
        return "This is a blog post"
    }
    func onSelection() {
        print("Display the blog ViewController")
    }
}

struct VideoCell: Cell {
    var description: String {
        return "This is a video"
    }
    func onSelection() {
        print("Display the video player ViewController")
    }
}

struct AdCell: Cell {
    var description: String {
        return "This is an ad"
    }
    func onSelection() {
        print("Visit an advertisement link")
    }
}

class ViewController: UIViewController { }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellType.allCases.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = CellFactory.createCell(fromIndexPath: indexPath).description
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CellFactory.createCell(fromIndexPath: indexPath).onSelection()
    }
}
