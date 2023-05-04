import Foundation

protocol CoordinatorNavigationProtocol: AnyObject {
    func changeTab(_ newSelectedTab: Tab)
    func open(_ page: Page)
    func pop()
    func popToRoot()
    func openSheet(_ sheet: Sheet)
    func dismissSheet()
    func openFullScreenCover(_ fullScreenCover: FullScreenCover)
    func dismissFullScreenCover()
}
