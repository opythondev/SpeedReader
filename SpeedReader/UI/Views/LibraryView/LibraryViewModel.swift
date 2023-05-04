import Foundation
import SwiftUI
import Combine

final class LibraryViewModel: ObservableObject {
    
    private weak var coordinator: CoordinatorNavigationProtocol?
    
    init() { }
    
    func setCoordinator(coordinator: CoordinatorNavigationProtocol) {
        self.coordinator = coordinator
    }
    
    func open(_ page: Page) {
        coordinator?.open(page)
    }
    
    func pop() {
        coordinator?.pop()
    }
    
    func popToRoot() {
        coordinator?.popToRoot()
    }
    
    func openFullScreenCover(_ page: FullScreenCover) {
        coordinator?.openFullScreenCover(page)
    }
}
