//

import XCTest
@testable import SpeedReader

final class AssemblyBuilderTests: XCTestCase {
    
    var sut: BuilderProtocol!

    override func setUpWithError() throws {
        sut = AssemblyBuilder()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testCreateMainModuleReturnType() {
        let mainModule = sut.createMainModule()
        let testObject = MainViewController()
        XCTAssertTrue(type(of: mainModule) == type(of: testObject))
    }

    func testMainModuleHasPresenter() {
        let mainModule = sut.createMainModule()
        XCTAssertNotNil(mainModule.presenter)
    }

}
