//

import Foundation
import UniformTypeIdentifiers
import MobileCoreServices
import PDFKit

protocol PresenterProtocol {
    
}

protocol MainViewPresenterProtocol: PresenterProtocol {
    init(view: MainViewProtocol, datamanager: DataManagerProtocol?)
    func getFakeBooksData() -> [Book]?
//    func callDocumentPicker()
//    func copyPDFData(from url: URL, name: String)
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    
    weak var view: MainViewProtocol?
    private var dataManager: DataManagerProtocol?
//    var pdfType: UTType?
    
    required init(view: MainViewProtocol, datamanager: DataManagerProtocol? = nil) {
        self.view = view
        self.dataManager = DataManager()
//        guard let pdfType = UTType(String(kUTTypePDF)) else { return }
//        view.importMenu = UIDocumentPickerViewController(forOpeningContentTypes: [pdfType], asCopy: true)
    }
    
    func getFakeBooksData() -> [Book]? {
        guard let fakeBooks = dataManager?.generateFakeStorageData() else { return nil }
        return fakeBooks
    }
    
//    func callDocumentPicker() {
//        
//    }
    
//    func copyPDFData(from url: URL, name: String) {
//        let pdf = PDFDocument(url: url)
//        guard let pageCount = pdf?.pageCount else { return }
//        guard let text = pdf?.string else { return }
//        let thumbnailSize = CGSize(width: 200, height: 200)
//        let thumbnail = generatePdfThumbnail(of: thumbnailSize, for: url, atPage: 0)
//        let book = Book(name: name, text: text, pageCount: pageCount, thumbnail: thumbnail)
//    }
//
//    private func generatePdfThumbnail(of thumbnailSize: CGSize , for documentUrl: URL, atPage pageIndex: Int) -> UIImage? {
//        let pdfDocument = PDFDocument(url: documentUrl)
//        let pdfDocumentPage = pdfDocument?.page(at: pageIndex)
//        return pdfDocumentPage?.thumbnail(of: thumbnailSize, for: PDFDisplayBox.trimBox)
//    }
}
