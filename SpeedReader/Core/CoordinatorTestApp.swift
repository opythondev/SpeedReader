//

import SwiftUI

@main
struct CoordinatorTestApp: App {
    
    @StateObject var coordinator: CoordinatorObject
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView(coordinator: coordinator)
        }
    }
    
    init() {
        let container = Container()
        let coordinator = container.coordinatorObject
        _coordinator = StateObject(wrappedValue: coordinator)
    }
}
