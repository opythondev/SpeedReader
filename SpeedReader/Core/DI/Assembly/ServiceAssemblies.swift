import UIKit

// lazySingleton - инитит объект при вызове впервые
// prototype - создает объект при каждом вызове

final class ServiceAssembly: Assembly {
    
    let router = Definition(scope: .lazySingleton) { c in
        Router(navigationController: c.navigationController, assembly: c)
    }
    
    let navigationController = Definition(scope: .lazySingleton) { c in
        UINavigationController()
    }
}
