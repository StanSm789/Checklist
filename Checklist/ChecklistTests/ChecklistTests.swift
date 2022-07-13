//
//  ChecklistTests.swift
//  ChecklistTests
//
//  Created by Stanislav Smirnov on 22/4/2022.
//

import XCTest
@testable import Checklist
/**
    This class contains unit tests for the Checklist struct.
*/
class ChecklistTests: XCTestCase {
    /// creating a new varivle that will be used in the unit tests
    let checklist = Checklist(name: "Checklist", items: [Item(name: "Some name", isTicked: true)])

    //// testing if asserted and actual values of an attribute *name* are equal
    func testNameWithoutError() throws {
        XCTAssertEqual(checklist.name, "Checklist")
    }
    

    //// testing if asserted and actual values of an attribute *name* are not equal
    func testNameWithError() throws {
        XCTAssertNotEqual(checklist.name, "Some other checklist")
    }

    //// testing if asserted and actual values of an attribute *items* are equal
    func testItemsWithoutError() throws {
        XCTAssertEqual(checklist.items[0].name, "Some name")
    }

    //// testing if asserted and actual values of an attribute *items* are not equal
    func testItemsWithError() throws {
        XCTAssertNotEqual(checklist.items, [])
    }
}
