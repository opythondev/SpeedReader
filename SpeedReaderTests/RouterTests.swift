//

import XCTest
@testable import SpeedReader

class MockNavigationController: UINavigationController {
    
}

final class RouterTests: XCTestCase {
    
    var sut: RouterProtocol!
    var navigationController = MockNavigationController()
    var assembly = Container()

    override func setUpWithError() throws {
        sut = Router(navigationController: navigationController, assembly: assembly)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSetInitialViewController() {
        sut.initialViewController()
        XCTAssertTrue(navigationController.viewControllers[0] is MainViewController)
    }

}
