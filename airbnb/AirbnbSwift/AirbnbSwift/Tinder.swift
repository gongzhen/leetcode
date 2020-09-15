//
//  Tinder.swift
//  AirbnbSwift
//
//  Created by Zhen Gong on 11/25/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Cocoa
// import XCTest
import Foundation

// OBJECTIVE: Determine the distance between two index paths in a table view.

extension IndexPath {

    var section: Int {
        guard count == 2, let first = first else { fatalError() }
        return first
    }

    var row: Int {
        guard count == 2, let last = last else { fatalError() }
        return last
    }

    init(row: Int, section: Int) {
        self.init(indexes: [section, row])
    }

}

class UITableViewMock {

    private let sections: [Int]

    var numberOfSections: Int {
        return sections.count
    }

    init(sections: [Int]) {
        self.sections = sections
    }

    func numberOfRows(inSection section: Int) -> Int {
        return sections[section]
    }

}

extension UITableViewMock {

    func distance(from fromIndexPath: IndexPath, to toIndexPath: IndexPath) -> Int {
      
        var startIndexPath: IndexPath = fromIndexPath
        var endIndexPath: IndexPath = toIndexPath
      
        var result : Int = 0
      
        var flipOver: Bool = false
        if startIndexPath.section == endIndexPath.section {
          // return endRow - startRow
          return endIndexPath.row - startIndexPath.row
        } else if startIndexPath.section > endIndexPath.section {
          flipOver = true
          startIndexPath = toIndexPath
          endIndexPath = fromIndexPath
          
        }
      
      
        // different section
        for section in startIndexPath.section...endIndexPath.section{
          if section == startIndexPath.section {
            result += (numberOfRows(inSection: section) - startIndexPath.row)
          }
          else if section == endIndexPath.section {
            result += endIndexPath.row
          } else {
            result += numberOfRows(inSection: section)
          }
        }
        
        if flipOver == true {
          return -result
        }
        return result
    }

//     func distance(from fromIndexPath: IndexPath, to toIndexPath: IndexPath) -> Int {
//         return absoluteIndex(for: toIndexPath) - absoluteIndex(for: fromIndexPath)
//     }

//     private func absoluteIndex(for indexPath: IndexPath) -> Int {
//         var start: Int = 0
//         if indexPath.section > 0 {
//             for index in 0...(indexPath.section-1) {
//                 start += numberOfRows(inSection: index)
//             }
//         }
//         start += indexPath.row
//         return start
//     }

  
}

// For example, when given a table view with three sections, where
// the first section has 10 rows, the second section has 30 rows and
// the third section has 20 rows.

let tableView = UITableViewMock(sections: [10, 30, 20])

class UITableViewTests: XCTestCase {

    static var allTests = {
        return [
            ("testA", testA),
            ("testB", testB),
            ("testC", testC),
            ("testD", testD),
            ("testE", testE),
            ("testF", testF),
            ("testG", testG),
            ("testH", testH),
            ("testI", testI),
            ("testJ", testJ),
            ("testK", testK),
            ("testL", testL),
            ("testM", testM)
        ]
    }()

    let tableView = UITableViewMock(sections: [10, 30, 20])

    func testA() {
        let distance = tableView.distance(from: IndexPath(row: 0, section: 0),
                                          to: IndexPath(row: 0, section: 0))
        XCTAssertEqual(distance, 0)
    }

    func testB() {
        let distance = tableView.distance(from: IndexPath(row: 0, section: 0),
                                          to: IndexPath(row: 1, section: 0))
        XCTAssertEqual(distance, 1)
    }

    func testC() {
        let distance = tableView.distance(from: IndexPath(row: 0, section: 0),
                                          to: IndexPath(row: 9, section: 0))
        XCTAssertEqual(distance, 9)
    }

    func testD() {
        let distance = tableView.distance(from: IndexPath(row: 0, section: 0),
                                          to: IndexPath(row: 0, section: 1))
        XCTAssertEqual(distance, 10)
    }

    func testE() {
        let distance = tableView.distance(from: IndexPath(row: 0, section: 0),
                                          to: IndexPath(row: 29, section: 1))
        XCTAssertEqual(distance, 39)
    }

    func testF() {
        let distance = tableView.distance(from: IndexPath(row: 0, section: 0),
                                          to: IndexPath(row: 0, section: 2))
        XCTAssertEqual(distance, 40)
    }

    func testG() {
        let distance = tableView.distance(from: IndexPath(row: 0, section: 0),
                                          to: IndexPath(row: 19, section: 2))
        XCTAssertEqual(distance, 59)
    }

    func testH() {
        let distance = tableView.distance(from: IndexPath(row: 1, section: 0),
                                          to: IndexPath(row: 18, section: 2))
        XCTAssertEqual(distance, 57)
    }

    func testI() {
        let distance = tableView.distance(from: IndexPath(row: 5, section: 0),
                                          to: IndexPath(row: 15, section: 1))
        XCTAssertEqual(distance, 20)
    }

    func testJ() {
        let distance = tableView.distance(from: IndexPath(row: 5, section: 1),
                                          to: IndexPath(row: 15, section: 1))
        XCTAssertEqual(distance, 10)
    }

    func testK() {
        let distance = tableView.distance(from: IndexPath(row: 5, section: 1),
                                          to: IndexPath(row: 15, section: 2))
        XCTAssertEqual(distance, 40)
    }

    func testL() {
        let distance = tableView.distance(from: IndexPath(row: 15, section: 2),
                                          to: IndexPath(row: 5, section: 1))
        XCTAssertEqual(distance, -40)
    }

    func testM() {
        let distance = tableView.distance(from: IndexPath(row: 8, section: 0),
                                          to: IndexPath(row: 2, section: 0))
        XCTAssertEqual(distance, -6)
    }
}

// XCTMain([testCase(UITableViewTests.allTests)])
