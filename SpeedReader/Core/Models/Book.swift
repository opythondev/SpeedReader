//

import UIKit

struct Book {
    let author: String
    let title: String
    let text: String
    let pageCount: Int
    let thumbnail: UIImage?
    
    private static let sampleText = "One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. \"What's happened to me?\" he thought. It wasn't a dream. His room, a proper human room although a little too small, lay peacefully between its four familiar walls. A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame. It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather."
}

extension Book: Hashable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.author + lhs.title + String(lhs.pageCount) == rhs.author + rhs.title + String(rhs.pageCount)
    }
}

extension Book {
    static func generateFakeStorageData() -> [Book] {
        var books = [Book]()
        let words = sampleText.components(separatedBy: " ")
        let thumbnail = UIImage(named: "cover")
        
        for i in 1...Int.random(in: 1..<words.count / 3) {
            let author = words[i] + " " + words[i + 1]
            let titleWords = words[i..<i + Int.random(in: 3..<10)]
            let title = titleWords.joined(separator: " ")
            let pages = Int.random(in: 0..<9999)
            let book = Book(author: author, title: title, text: sampleText, pageCount: pages, thumbnail: thumbnail)
            books.append(book)
        }
        return books
    }
}
