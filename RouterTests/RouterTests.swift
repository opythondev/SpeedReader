import XCTest
import SwiftUI
import Combine
@testable import CoordinatorTest

final class RouterTests: XCTestCase {
    
    var sut: Router!
    var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        let navigationPath = NavigationPath()
        sut = Router(path: navigationPath)
        cancellables = .init()
    }

    override func tearDownWithError() throws {
        sut = nil
        cancellables = nil
    }

    func testInitWithDefaultTab() throws {
        XCTAssertTrue(sut.path.count == 0)
        XCTAssertTrue(sut.tab == .library)
        XCTAssertTrue(sut.sheet == nil)
        XCTAssertTrue(sut.fullScreenCover == nil)
    }
    
    func testChangeTab() throws {
        // Given
        let expectation = expectation(description: "New tab is .explorer")
        let newTab: Tab = .explorer
        
        sut.$tab
        // skip init value .library
            .dropFirst()
            .sink { tab in
                XCTAssertEqual(newTab, tab)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //When
        sut.changeTab(.explorer)
        
        //Then
        wait(for: [expectation], timeout: 1)
    }
    
    func testOpenPage() throws {
        // Given
        let expectation = expectation(description: "Path updated")
        let newPage: Page = .secondPage
        
        sut.$path
        // skip init value nil
            .dropFirst()
            .sink { path in
                XCTAssertEqual(path.count, 1)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //When
        sut.openPage(newPage)
        
        //Then
        wait(for: [expectation], timeout: 1)
    }

    func testPopWhenPathIsEmpty() throws {
        // Given
        let expectation = expectation(description: ".pop() when path is empty")
        
        sut.$path
            .sink { path in
                XCTAssertEqual(path.count, 0)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //When
        sut.pop()
        
        //Then
        wait(for: [expectation], timeout: 1)
    }
    
    func testPopWhenPathIsNotEmpty() throws {
        // Given
        let expectation = expectation(description: ".pop() when path is not empty")
        
        // init path count == 0
        // path to open after init +1 count
        sut.openPage(.page)
        // second path to open +1 count
        sut.openPage(.secondPage)

        sut.$path
        // skip init 0 value
            .dropFirst()
            .sink { path in
                XCTAssertEqual(path.count, 1)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //When
        // count 2, pop() = count - 1 (last)
        sut.pop()
        
        //Then
        wait(for: [expectation], timeout: 1)
    }
    
    func testPopToRootIfPathIsEmpty() {
        //Given
        let expectation = expectation(description: "Navigation count should be equal zero")
        
        sut.$path
            .sink { path in
                XCTAssertEqual(path.count, 0)
                expectation.fulfill()
        }
            .store(in: &cancellables)
        
        //When
        sut.popToRoot()
        
        //Then
        wait(for: [expectation], timeout: 1)
    }
    
    func testPopToRoot() throws {
        //Given
        let expectation = expectation(description: "Navigation count should be equal zero")
        
        sut.openPage(.page)
        sut.openPage(.secondPage)
        sut.openPage(.secondPage)
        sut.openPage(.page)
        sut.openPage(.secondPage)
        sut.openPage(.secondPage)

        
        sut.$path
            .dropFirst()
            .sink { path in
                XCTAssertEqual(path.count, 0)
                expectation.fulfill()
        }
            .store(in: &cancellables)
        
        //When
        sut.popToRoot()
        
        //Then
        wait(for: [expectation], timeout: 1)
    }

    func testOpenSheet() throws {
        //Given
        let expectation = expectation(description: "Sheet != nil")
        
        sut.$sheet
            .dropFirst()
            .sink { sheet in
                XCTAssertTrue(sheet == .sheetView)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //When
        sut.openSheet(.sheetView)
        //Then
        wait(for: [expectation], timeout: 1)
    }

    func testDismissSheet() throws {
        //Given
        let expectation = expectation(description: "Sheet == nil")
        sut.openSheet(.sheetView)
        
        sut.$sheet
            .dropFirst()
            .sink { sheet in
                XCTAssertTrue(sheet == nil)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //When
        sut.dismissSheet()
        //Then
        wait(for: [expectation], timeout: 1)
    }

    func testOpenFullScreenCover() throws {
        //Given
        let expectation = expectation(description: "FullScreenCover != nil")
        
        sut.$fullScreenCover
            .dropFirst()
            .sink { sheet in
                XCTAssertTrue(sheet == .detailView)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //When
        sut.openFullScreenCover(.detailView)
        //Then
        wait(for: [expectation], timeout: 1)
    }

    func testDismissFullScreenCover() throws {
        //Given
        let expectation = expectation(description: "FullScreenCover == nil")
        sut.openFullScreenCover(.detailView)

        sut.$fullScreenCover
            .dropFirst()
            .sink { screen in
                XCTAssertTrue(screen == nil)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //When
        sut.dismissFullScreenCover()
        //Then
        wait(for: [expectation], timeout: 1)
    }

}
