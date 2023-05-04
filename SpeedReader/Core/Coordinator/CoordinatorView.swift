import SwiftUI

struct CoordinatorView: View {
    
    @ObservedObject var coordinator: CoordinatorObject
    private let tabOne = TabModel(id: 0, tabItem: .library, label: "Library", systemImage: "list.dash")
    private let tabTwo = TabModel(id: 1, tabItem: .explorer, label: "Explore", systemImage: "folder.fill.badge.questionmark")
    
    
    var body: some View {
        coordinator.buildTabs(tabItems: [tabOne, tabTwo])
            .navigationDestination(for: Page.self) { page in
                coordinator.build(page)
            }
            .fullScreenCover(item: coordinator.bindFullScreenCover()) { cover in
                coordinator.build(cover)
            }
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView(coordinator: CoordinatorObject(assembly: Container()))
    }
}
