//

import UIKit

protocol BuilderProtocol {
    func createMainModule() -> MainViewController
}

final class AssemblyBuilder: BuilderProtocol {
    func createMainModule() -> MainViewController {
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
