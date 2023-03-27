//

import XCTest
@testable import SpeedReader

final class MockType {
    
}

final class MockAssembly: Assembly {
    var mockSingletonObject = Definition(scope: .lazySingleton) { c in
        MockType()
    }
    
    var mockPrototypeObject = Definition(scope: .prototype) { c in
        MockType()
    }
}

extension Container {    
    subscript <Value> (dynamicMember keyPath: KeyPath<MockAssembly, Definition<Value>>) -> Value {
        return resolve(keyPath: keyPath)
    }
}

final class DITests: XCTestCase {
    
    var sut: Container!

    override func setUpWithError() throws {
        sut = Container()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testResolveSingleton() throws {
        let objectOne = sut.mockSingletonObject
        let objectTwo = sut.mockSingletonObject
        XCTAssertIdentical(objectOne, objectTwo)
    }
    
    func testResolvePrototype() throws {
        let objectOne = sut.mockPrototypeObject
        let objectTwo = sut.mockPrototypeObject
        XCTAssertNotIdentical(objectOne, objectTwo)
    }

}
