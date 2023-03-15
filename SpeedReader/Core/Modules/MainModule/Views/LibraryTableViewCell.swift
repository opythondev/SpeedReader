//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    var title: String?
    var author: String?
    var progress: String?
    var thumbnail: UIImage?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title = nil
        author = nil
        progress = nil
        thumbnail = nil
    }

}
