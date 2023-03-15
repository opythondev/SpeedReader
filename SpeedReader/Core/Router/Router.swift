//

import UIKit


protocol RouterProtocol {
    func initialViewController()
    func popToRoot()
}

final class Router: RouterProtocol {
    
    private var navigationController: UINavigationController?
    private weak var assembly: Container?
    
    init(navigationController: UINavigationController, assembly: Container) {
        self.navigationController = navigationController
        self.assembly = assembly
    }

    func initialViewController() {
        guard let mainViewController = assembly?.mainView else { return }
        navigationController?.viewControllers = [mainViewController]
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
