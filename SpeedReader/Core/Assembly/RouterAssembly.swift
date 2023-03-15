import Foundation

final class RouterAssembly: Assembly {
    var router = Definition(scope: .lazySingleton) { c in
        Router(navigationController: c.navigationController, assembly: c)
    }
}
