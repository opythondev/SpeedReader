enum Page: Codable {
    case page, secondPage
}

enum Tab: String, Identifiable {
    case library, explorer
    
    var id: String {
        self.rawValue
    }
}

enum Sheet {
    case sheetView
}

enum FullScreenCover: String, Identifiable  {
    case detailView
    
    var id: String {
        self.rawValue
    }
}
