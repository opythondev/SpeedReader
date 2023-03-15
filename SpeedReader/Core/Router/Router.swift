//

import UIKit


protocol RouterProtocol {
    func initialViewController()
    func popToRoot()
}

final class Router: RouterProtocol {
    
    private var navigationController: UINavigationController?
    private var assemblyBuilder: BuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: BuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func initialViewController() {
//        guard let mainViewController = assemblyBuilder?.createMainModule() else { return }
        guard let mainViewController = assemblyBuilder?.createTempMainModule() else { return }
        navigationController?.viewControllers = [mainViewController]
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
