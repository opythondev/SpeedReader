import Foundation
import Combine

enum InputError: Error {
    case minCount
}

protocol BaseViewModelProtocol {
    func transform(input: AnyPublisher<ViewModelInput, Never>) -> AnyPublisher<ViewModelOutput, Never>
}

protocol ViewModelInput { }
protocol ViewModelOutput { }

class BaseViewModel: BaseViewModelProtocol {
    
    typealias BasicOutputs = BaseViewModel.Output
    
    enum Input: ViewModelInput {
        case viewDidAppear
        case textChanged(inputText: String)
    }
    
    enum Output: ViewModelOutput {
        case inputError(error: InputError)
        case updateLabel(text: String)
    }
    
    private var cancellables = Set<AnyCancellable>()
    private let output: PassthroughSubject<ViewModelOutput, Never> = .init()
    
    func transform(input: AnyPublisher<ViewModelInput, Never>) -> AnyPublisher<ViewModelOutput, Never> {
        input
            .compactMap({ $0 as? BaseViewModel.Input })
            .sink { [weak self] event in
                switch event {
                case .viewDidAppear:
                    self?.output.send(BasicOutputs.updateLabel(text: "Welcome"))
                case let .textChanged(eventText):
                    self?.output.send(BasicOutputs.updateLabel(text: eventText))
                }
            }.store(in: &cancellables)
        
        return output.eraseToAnyPublisher()
    }
}
