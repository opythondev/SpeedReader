import SwiftUI
// lazySingleton - инитит объект при вызове впервые
// prototype - создает объект при каждом вызове

final class MainAssembly: Assembly {
    
    let navigationPath = Definition(scope: .lazySingleton) { c in
        NavigationPath()
    }
    
    let router = Definition(scope: .lazySingleton) { c in
        Router(path: c.navigationPath, tab: .library)
    }
}

final class CoordinatorAssembly: Assembly {
    
    let coordinatorObject = Definition(scope: .lazySingleton) { c in
        CoordinatorObject(assembly: c)
    }
}

final class ViewModelAssembly: Assembly {
    
    /// view model without coordinator navigation object
    let libraryViewModel = Definition(scope: .lazySingleton) { c in
       LibraryViewModel()
    }
    
    /// view model without coordinator navigation object
    let explorerViewModel = Definition(scope: .lazySingleton) { c in
        ExplorerViewModel()
    }
    
    let basicPageViewModel = Definition(scope: .lazySingleton) { c in
        BasicPageViewModel()
    }
}
