//

import UIKit

/// Output interface
protocol MainViewProtocol: AnyObject {
    
}

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    lazy var tableView: UITableView = createEmptyTableView()
    private let reuseIdentifier = "Cell"
    private let mainColor: UIColor = .white

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupDelegates()
        setupUI()
    }
}


// MARK: - View Setup
extension MainViewController {
    
    private func registerCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupUI() {
        setupBackGroundColor()
        view.addSubview(tableView)
        setupConstraints()
        setupNavigationBar("Main")
    }
    
    private func setupBackGroundColor() {
        view.backgroundColor = mainColor
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)
        ])
    }
    
    private func setupNavigationBar(_ title: String) {
        navigationItem.title = title
        navigationController?.navigationBar.prefersLargeTitles = false
//        guard let font = UIFont.ManropeFont.headLineSemiBoldSixteen.value else { return }

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = mainColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = mainColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        addAddButton()
    }
    
    private func addAddButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFile))
        button.tintColor = .systemBlue
        navigationItem.rightBarButtonItems = [button]
    }
    
    @objc private func addFile() {
        print("add")
    }
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        //        let comment = presenter.comments?[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "text"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
}


extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: MainViewProtocol {
    
}
