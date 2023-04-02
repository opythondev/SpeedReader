import Foundation

// lazySingleton - инитит объект при вызове впервые
// prototype - создает объект при каждом вызове

final class ViewAssembly: Assembly {
    
    let mainViewModel = Definition(scope: .lazySingleton) { c in
        MainViewModel()
    }
    
    let mainView = Definition(scope: .lazySingleton) { c in
        MainViewController(viewModel: c.mainViewModel)
    }
}
