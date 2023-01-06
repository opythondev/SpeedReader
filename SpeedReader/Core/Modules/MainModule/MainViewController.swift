//

import UIKit

/// Output interface
protocol MainViewProtocol: AnyObject {
    
}

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
    lazy var tableView: UITableView = createEmptyTableView()
    private let reuseIdentifier = "Cell"

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
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)
        ])
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
