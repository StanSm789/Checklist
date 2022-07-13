//
//  ItemTests.swift
//  ChecklistTests
//
//  Created by Stanislav Smirnov on 22/4/2022.
//

import XCTest
@testable import Checklist
/**
    This class contains unit tests for the Item struct.
*/
class ItemTests: XCTestCase {
    /// creating a new varivle that will be used in the unit tests
    let item = Item(name: "Some name", isTicked: true)
    
    //// testing if asserted and actual values of an attribute *name* are equal
    func testNameWithoutError() throws {
        XCTAssertEqual(item.name, "Some name")
    }
    
    /// testing if asserted and actual values of an attribute *name* are not equal
    func testNameWithError() throws {
        XCTAssertNotEqual(item.name, "Some other name")
    }
    
    /// testing if asserted and actual values of an attribute *isTicked* are equal
    func testIsTickedWithoutError() throws {
        XCTAssertEqual(item.isTicked, true)
    }
    
    /// testing if asserted and actual values of an attribute *isTicked* are not equal
    func testIsTickedWithError() throws {
        XCTAssertNotEqual(item.isTicked, false)
    }

}
