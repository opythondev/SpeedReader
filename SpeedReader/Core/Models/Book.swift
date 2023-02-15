//

import UIKit

struct Book {
    let author: String
    let title: String
    let text: String
    let pageCount: Int
    let thumbnail: UIImage?
}

extension Book: Hashable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.author + lhs.title + String(lhs.pageCount) == rhs.author + rhs.title + String(rhs.pageCount)
    }
}
