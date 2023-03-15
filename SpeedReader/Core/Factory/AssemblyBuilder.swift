//

import UIKit

protocol BuilderProtocol {
    func createMainModule() -> MainViewController
    func createTempMainModule() -> TempViewController
}

final class AssemblyBuilder: BuilderProtocol {
    func createMainModule() -> MainViewController {
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func createTempMainModule() -> TempViewController {
        let view = TempViewController(navigationBarTitle: "Library")
        let dataManager = DataManager()
        let presenter = TempMainViewPresenter(view: view, dataManager: dataManager)
        view.setupViewControllerWith(presenter: presenter)
        return view
    }
}
