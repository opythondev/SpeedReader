//

import Foundation


protocol PresenterProtocol {
    
}

protocol MainViewPresenterProtocol: PresenterProtocol {
    init(view: MainViewProtocol)
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
}
