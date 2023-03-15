//

import UIKit

protocol TempMainViewProtocol: AnyObject {
    func setupViewControllerWith(presenter: TempMainViewPresenterProtocol)
}

final class TempViewController: UIViewController {
    
    private var presenter: TempMainViewPresenterProtocol?
    private var fakeBooks: [Book]?
    private var tableView: UITableView?
    private let reuseIdentifier = "Cell"
    private let mainColor: UIColor = .white

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupDelegates()
        setupUI()
    }
    
    init(navigationBarTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.setNavigationBarTitile(navigationBarTitle)
        self.tableView = createEmptyTableView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }
}

// MARK: - Custom Protocols Imp
extension TempViewController: TempMainViewProtocol {
    func setupViewControllerWith(presenter: TempMainViewPresenterProtocol) {
        self.presenter = presenter
        self.fakeBooks = presenter.getFakeBooksData()
    }
}

// MARK: - View Setup
extension TempViewController {
    
    private func registerCell() {
        tableView?.register(LibraryTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    private func setupDelegates() {
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    private func setupUI() {
        guard let table = tableView else { return }
        setupBackgroundColor()
        view.addSubview(table)
        setupConstraints()
        setupNavigationBarUI()
        addNavButtons()
    }
    
    private func setupBackgroundColor() {
        view.backgroundColor = mainColor
    }
    
    private func setupConstraints() {
        guard let tableView = tableView else { return }
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)
        ])
    }
}

// MARK: - Navigation Bar UI Setup
extension TempViewController {
    
    private func setNavigationBarTitile(_ title: String) {
        navigationItem.title = title
    }
    
    private func setupNavigationBarUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = mainColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = mainColor
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func addNavButtons() {
        guard let addButton = setupRightButton(), let sortButton = setupLeftButton() else { return }
        navigationItem.leftBarButtonItems = [sortButton]
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    private func setupLeftButton() -> UIBarButtonItem? {
        let sortButton = createNavBarSortButton(color: .systemBlue)
        guard let presenterObjc = presenter as? TempMainViewPresenterProtocolObjC else { return nil }
        sortButton.target = self
        sortButton.action = #selector(presenterObjc.addFile2)
        return sortButton
    }
    
    private func setupRightButton() -> UIBarButtonItem? {
        let addButton = createNavBarAddButton(color: .systemBlue)
        guard let presenterObjc = presenter as? TempMainViewPresenterProtocolObjC else { return nil }
        addButton.target = self
        addButton.action = #selector(presenterObjc.addFile2)
        return addButton
    }
}

// MARK: - UITableViewDataSource
extension TempViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? LibraryTableViewCell else { return UITableViewCell()}
        var content = cell.defaultContentConfiguration()
        guard let author = fakeBooks?[indexPath.row].author else { return cell }
        guard let title = fakeBooks?[indexPath.row].title else { return cell }
        guard let pages = fakeBooks?[indexPath.row].pageCount else { return cell }
        
        content.text = author
        content.secondaryText = "\(title) \n\(pages)"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = fakeBooks?.count else { return 0 }
        return count
    }
}

// MARK: - UITableViewDelegate
extension TempViewController: UITableViewDelegate {
    
}
