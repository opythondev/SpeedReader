import SwiftUI
import Combine

struct LibraryView: View {
    
    @ObservedObject private var viewModel: LibraryViewModel
    @State var isOpenOutside: Bool = false
    
    var body: some View {
            VStack {
                Text("Library View")
                    .padding(.bottom, 10)
                Button("Open Page") {
                    viewModel.open(.page)
                }
                .padding(.bottom, 10)
                Button("Open Full Screen Cover") {
                    viewModel.openFullScreenCover(.detailView)
                }
                .padding(.bottom, 10)
                NavigationLink("Test") {
                    Text("kkk")
                }
            }
            .navigationTitle("Library")
    }
    
    init(viewModel: LibraryViewModel) {
        self.viewModel = viewModel
    }
}

struct LibraryView_Previews: PreviewProvider {
    static let router = Router(path: NavigationPath())
    static let viewModel = LibraryViewModel()
    static let assembly = Container()
    static let coordinator = CoordinatorObject(assembly: assembly)
    static var previews: some View {
        LibraryView(viewModel: viewModel)
    }
}
