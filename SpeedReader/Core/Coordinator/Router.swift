import SwiftUI

final class Router: ObservableObject {
    
    @Published var path: NavigationPath
    @Published var tab: Tab
    
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    init(path: NavigationPath, tab: Tab = .library) {
        self.tab = tab
        self.path = path
    }
    
    // MARK: - Navigation
    
    func changeTab(_ newSelectedTab: Tab) {
        tab = newSelectedTab
    }
    
    func openPage(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        if path.isEmpty { return }
        path.removeLast()
    }
    
    func popToRoot() {
        if path.isEmpty { return }
        path.removeLast(path.count)
    }
    
    func openSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func openFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
}
