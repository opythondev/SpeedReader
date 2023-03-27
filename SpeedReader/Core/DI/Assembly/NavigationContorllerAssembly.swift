import UIKit

// lazySingleton - инитит объект при вызове впервые
// prototype - создает объект при каждом вызове

final class NavigationContorllerAssembly: Assembly {
    var navigationController = Definition(scope: .lazySingleton) { c in
        UINavigationController()
    }
}
