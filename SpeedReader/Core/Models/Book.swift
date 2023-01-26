//

import UIKit

struct Book {
    let name: String
    let text: String
    let pageCount: Int
    let thumbnail: UIImage?
}

extension Book: Hashable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.name + String(lhs.pageCount) == rhs.name + String(rhs.pageCount)
    }
}
