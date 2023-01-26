//

import XCTest
@testable import SpeedReader

class MockNavigationController: UINavigationController {
    
}

final class RouterTests: XCTestCase {
    
    var sut: RouterProtocol!
    var navigationController = MockNavigationController()
    var assemblyBuilder = AssemblyBuilder()

    override func setUpWithError() throws {
        sut = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSetInitialViewController() {
        sut.initialViewController()
        XCTAssertTrue(navigationController.viewControllers[0] is MainViewController)
    }

}
