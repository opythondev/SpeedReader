//

import UIKit

/// Output interface
protocol MainViewProtocol: AnyObject {
    
}

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

}

extension MainViewController: MainViewProtocol {
    
}
