//
//  ChecklistViewModelTests.swift
//  ChecklistTests
//
//  Created by Stanislav Smirnov on 22/4/2022.
//

import XCTest
@testable import Checklist
/**
    This class contains unit tests for the ChecklistViewModel struct.
*/
class ChecklistViewModelTests: XCTestCase {
    /// creating a new varivle that will be used in the unit tests
    let checklist = ChecklistViewModel(checklist: Checklist(name: "Checklist", items: [Item(name: "Some name", isTicked: true)]))
    
    /// testing if asserted and actual values of an attribute *checklist* are equal
    func testChecklistWithoutError() throws {
        XCTAssertEqual(checklist, checklist)
    }

    /// testing if asserted and actual values of an attribute *checklist* are not equal
    func testChecklistWithError() throws {
        XCTAssertNotEqual(checklist, ChecklistViewModel(checklist: Checklist(name: "Another", items: [Item(name: "Some name", isTicked: true)])))
    }
}
