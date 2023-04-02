import UIKit
import Combine

final class MainViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private var viewModel: BaseViewModelProtocol
    
    private var someViewModel: ViewModelEditProtocol = SomeViewModel(state: ViewDataState(text: "Started", isLoading: false))
    
    private var cancellables = Set<AnyCancellable>()
    private let viewControllerInput = PassthroughSubject<ViewModelInput, Never>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldTarget()
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewControllerInput.send(BaseViewModel.Input.viewDidAppear)
    }
    
    init(viewModel: BaseViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func textDidEndEditing() {
        guard let text = textField?.text else { return }
        viewControllerInput.send(BaseViewModel.Input.textChanged(inputText: text))
        someViewModel.setText(value: text)
        someViewModel.setBool()
    }
    
    private func setTextFieldTarget() {
        textField.addTarget(self, action: #selector(textDidEndEditing), for: .editingChanged)
    }
    
    private func bind() {
        someViewModel.statePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self ] viewState in
                self?.textLabel.text = viewState.text
            }.store(in: &cancellables)
        
//        let output = viewModel.transform(input: input.eraseToAnyPublisher())
//
//        output
//            .receive(on: RunLoop.main)
//            .compactMap({ $0 as? BaseViewModel.Output })
//            .sink { [weak self] event in
//                switch event {
//                case let .inputError(error):
//                    self?.textLabel.text = error.localizedDescription
//                case let .updateLabel(text):
//                    self?.textLabel.text = text
//                }
//            }.store(in: &cancellables)
    }
    
}
