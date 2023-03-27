//

import XCTest
@testable import SpeedReader

final class UIViewControllerExtensionTests: XCTestCase {
    
    var sut: UIViewController!

    override func setUpWithError() throws {
        sut = UIViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testCreateNewTableView() {
        let table = sut.createEmptyTableView()
        XCTAssertTrue(type(of: table) == UITableView.self)
    }
    
    func testNewTableSetAutoresizingMask() {
        let table = sut.createEmptyTableView()
        XCTAssertFalse(table.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testCreateAddButton() {
        let addButton = sut.createNavBarAddButton(color: .blue)
        XCTAssertTrue(addButton.action == nil)
        XCTAssertTrue(addButton.target == nil)
        XCTAssertTrue(addButton.tintColor == .blue)
    }
    
    func testCreateSortButton() {
        let addButton = sut.createNavBarSortButton(color: .blue)
        XCTAssertTrue(addButton.action == nil)
        XCTAssertTrue(addButton.target == nil)
        XCTAssertTrue(addButton.tintColor == .blue)
    }

}
