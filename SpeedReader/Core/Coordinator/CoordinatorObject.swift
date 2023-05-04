import SwiftUI
import Combine

final class CoordinatorObject: ObservableObject {
    
    @Published private var libraryViewModel: LibraryViewModel!
    @Published private var explorerViewModel: ExplorerViewModel!
    @Published private var basicPageViewModel: BasicPageViewModel!
    
    private var assembly: Container
    private var router: Router
    private var cancellables = Set<AnyCancellable>()
        
    init(assembly: Container) {
        self.assembly = assembly
        self.router = assembly.router
        setupViewModels()
        subscribeToRouterPublishers()
    }
    
    func getPath() -> Binding<NavigationPath> {
        Binding { [unowned self] in
            self.router.path
        } set: { [unowned self] newValue in
            self.router.path = newValue
        }
    }
    
    func getTab() -> Binding<Tab> {
        Binding { [unowned self] in
            self.router.tab
        } set: { [unowned self] newValue in
            self.router.tab = newValue
        }
    }
    
    func bindFullScreenCover() -> Binding<FullScreenCover?> {
        Binding { [unowned self] in
            self.router.fullScreenCover
        } set: { [unowned self] newValue in
            self.router.fullScreenCover = newValue
        }
    }
    
    private func setupViewModels() {
        basicPageViewModel = assembly.basicPageViewModel
        basicPageViewModel.setCoordinator(coordinator: self)
        
        libraryViewModel = assembly.libraryViewModel
        libraryViewModel.setCoordinator(coordinator: self)
        
        explorerViewModel = assembly.explorerViewModel
        explorerViewModel.setCoordinator(coordinator: self)
    }
    
    // MARK: -- Subscription to router updates
    
    private func subscribeToRouterPublishers() {
        /// Subscribtion to router Path updates.
        router.$path.sink { [weak self] pathEvent in
            self?.objectWillChange.send()
        }.store(in: &cancellables)
        
        /// Subscribtion to router fullScreenCover updates.
        router.$fullScreenCover.sink { [weak self] fullScreenCover in
            self?.objectWillChange.send()
        }.store(in: &cancellables)
    }
}

// MARK: - Navigation Methods

extension CoordinatorObject: CoordinatorNavigationProtocol {
    func changeTab(_ newSelectedTab: Tab) {
        router.changeTab(newSelectedTab)
    }
    
    func open(_ page: Page) {
        router.openPage(page)
    }
    
    func pop() {
        router.pop()
    }
    
    func popToRoot() {
        router.popToRoot()
    }
    
    func openSheet(_ sheet: Sheet) {
        router.openSheet(sheet)
    }
    
    func dismissSheet() {
        router.dismissSheet()
    }
    
    func openFullScreenCover(_ fullScreenCover: FullScreenCover) {
        router.openFullScreenCover(fullScreenCover)
    }
    
    func dismissFullScreenCover() {
        router.dismissFullScreenCover()
    }
}

//MARK: - ViewBuilder Methods

extension CoordinatorObject {
    @ViewBuilder
    func buildTabs(tabItems: [TabModel]) -> some View {
        weak var weakSelf = self
        let sorted = tabItems.sorted(by: { $0.id < $1.id })
        TabView(selection: weakSelf?.getTab()) {
            ForEach(sorted) { [weak self] tab in
                NavigationView {
                    self?.build(tab.tabItem)
                }
                .tag(tab.tabItem)
                .tabItem {
                    Label(tab.label, systemImage: tab.systemImage)
                }
            }
        }
    }
    
    @ViewBuilder
    func build(_ page: Tab) -> some View {
        switch page {
        case .library:
            LibraryView(viewModel: libraryViewModel)
        case .explorer:
            ExplorerView(viewModel: explorerViewModel)
        }
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .page:
            PageView(viewModel: basicPageViewModel)
        case .secondPage:
            SecondPageView(viewModel: basicPageViewModel)
        }
    }
    
    @ViewBuilder
    func build(_ cover: FullScreenCover) -> some View {
        switch cover {
        case .detailView:
            FullScreenCoverView(viewModel: basicPageViewModel)
        }
    }
}
