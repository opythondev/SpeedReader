import Foundation
import Combine

final class MainViewModel: BaseViewModel {
    
    
}

//protocol ViewModelPublisher {
//    var text: String { get }
//    var textPublisher: Published<String>.Publisher { get }
//    var input: PassthroughSubject<String, Never> { get }
//}

struct ViewDataState {
    var text: String
    var isLoading: Bool
}

protocol ViewModelEditProtocol {
    var statePublisher: Published<ViewDataState>.Publisher { get }
    func setBool()
    func setText(value: String)
}

class SomeViewModel: ViewModelEditProtocol {
    
    @Published private var state: ViewDataState
    var statePublisher: Published<ViewDataState>.Publisher { $state }
    private var cancellables = Set<AnyCancellable>()
    
    init(state: ViewDataState) {
        self.state = state
    }
    
    func setBool() {
        state.isLoading.toggle()
        print(state.isLoading)
    }
    
    func setText(value: String) {
        state.text = value
    }
}

