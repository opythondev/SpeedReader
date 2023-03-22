import UIKit

extension UIViewController {
    
    func createEmptyTableView() -> UITableView {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }
    
    func createNavBarSortButton(color: UIColor) -> UIBarButtonItem {
        let sortButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down.circle"), style: .plain, target: nil, action: nil)
        sortButton.tintColor = color
        return sortButton
    }
    
    func createNavBarAddButton(color: UIColor) -> UIBarButtonItem {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        addButton.tintColor = color
        return addButton
    }
    
}
