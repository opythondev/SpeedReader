//

import UIKit

protocol BuilderProtocol {
    func createMainModule() -> UIViewController
}

final class AssemblyBuilder: BuilderProtocol {
    func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
