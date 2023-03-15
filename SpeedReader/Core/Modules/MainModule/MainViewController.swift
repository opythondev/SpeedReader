//

import UIKit

/// Output interface
protocol MainViewProtocol: AnyObject {
    var presenter: MainViewPresenterProtocol? { get set }
    //    var importMenu: UIDocumentPickerViewController? { get set }
    //    func showImportMenu()
}

final class MainViewController: UIViewController, MainViewProtocol {
    
    var presenter: MainViewPresenterProtocol?
    private lazy var fakeBooks = presenter?.getFakeBooksData()
    //    private var importMenu: UIDocumentPickerViewController?
    //    private weak var menu: UIDocumentPickerViewController?
    private lazy var tableView = createEmptyTableView()
    
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
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupUI() {
        setupBackGroundColor()
        view.addSubview(tableView)
        setupConstraints()
        setupNavigationBar("Library")
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
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = mainColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.tintColor = mainColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        addNavButtons()
    }
    
    private func addNavButtons() {
        setRightButtons()
        setLeftButtons()
    }
    
    private func setLeftButtons() {
        let sortButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFile))
        sortButton.tintColor = .systemBlue
        navigationItem.leftBarButtonItems = [sortButton]
    }
    
    private func setRightButtons() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFile))
        addButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItems = [addButton]
    }
}

extension MainViewController: UINavigationControllerDelegate, UIDocumentPickerDelegate {
    
    @objc private func addFile() {
        
    }
    
    //    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
    //        let file = urls[0]
    //        let fileName = file.lastPathComponent
    //        presenter?.copyPDFData(from: file, name: fileName)
    //    }
    
    //    func showImportMenu() {
    //        guard let menu = importMenu else { return }
    //        present(menu, animated: true)
    //    }
}



extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        //      let comment = presenter.comments?[indexPath.row]
        var content = cell.defaultContentConfiguration()
        guard let author = fakeBooks?[indexPath.row].author else { return cell }
        guard let title = fakeBooks?[indexPath.row].title else { return cell }
        guard let pages = fakeBooks?[indexPath.row].pageCount else { return cell }
        //        guard let tumbnail = fakeBooks?[indexPath.row].thumbnail else { return cell }
        
        content.text = author
        content.secondaryText = "\(title) \n\(pages)"
        //        content.image = tumbnail
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = fakeBooks?.count else { return 0 }
        return count
    }
}


extension MainViewController: UITableViewDelegate {
    
}
