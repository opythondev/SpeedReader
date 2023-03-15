//

import Foundation

protocol TempMainViewPresenterProtocol: AnyObject {
    init(view: TempMainViewProtocol, dataManager: DataManagerProtocol?)
    func getFakeBooksData() -> [Book]?
}

@objc
protocol TempMainViewPresenterProtocolObjC {
    func addFile2()
}

final class TempMainViewPresenter: TempMainViewPresenterProtocol {
    
    
    private weak var view: TempMainViewProtocol?
    private var dataManager: DataManagerProtocol?
    
    required init(view: TempMainViewProtocol, dataManager: DataManagerProtocol?) {
        self.view = view
        self.dataManager = dataManager
    }
    
    func getFakeBooksData() -> [Book]? {
        guard let fakeBooks = dataManager?.generateFakeStorageData() else { return nil }
        return fakeBooks
    }
}

// MARK: - ObjC Methods
extension TempMainViewPresenter: TempMainViewPresenterProtocolObjC {
    
    @objc func addFile2() {
        print("action!")
    }
}
