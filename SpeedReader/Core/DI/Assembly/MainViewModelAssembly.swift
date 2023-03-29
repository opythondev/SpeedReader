import Foundation

// lazySingleton - инитит объект при вызове впервые
// prototype - создает объект при каждом вызове

final class MainViewModelAssembly: Assembly {
    var mainViewModel = Definition(scope: .lazySingleton) { c in
        MainViewModel()
    }
}
