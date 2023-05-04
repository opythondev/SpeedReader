import SwiftUI

struct ExplorerView: View {
    
    @ObservedObject private var viewModel: ExplorerViewModel
    
    var body: some View {
            VStack {
                Text("Explorer View")
                Button("Open Second Page") {
                    viewModel.open(.secondPage)
                }
            }
            .navigationTitle("Explorer")
    }
    
    init(viewModel: ExplorerViewModel) {
        self.viewModel = viewModel
    }
}

struct ExplorerView_Previews: PreviewProvider {
    static let router = Router(path: NavigationPath())
    static let assembly = Container()
    static let coordinator = CoordinatorObject(assembly: assembly)
    static let viewModel = ExplorerViewModel()
    static var previews: some View {
        ExplorerView(viewModel: viewModel)
    }
}
