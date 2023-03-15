import Foundation

// lazySingleton - инитит объект при вызове впервые
// prototype - создает объект при каждом вызове

final class MainViewAssembly: Assembly {
    var mainView = Definition(scope: .lazySingleton) { c in
        MainViewController(nibName: nil, bundle: nil)
    }
}
