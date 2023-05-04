import SwiftUI

struct PageView: View {

    @ObservedObject private var viewModel: BasicPageViewModel

    var body: some View {
//        NavigationView {
            VStack {
                Text("Page View")
                Divider()
                Button("Pop") {
                    viewModel.pop()
                }
                .padding(.bottom, 10)
                Button("Pop to root") {
                    viewModel.popToRoot()
                }
                
            }
//        }
    }
    
    init(viewModel: BasicPageViewModel) {
        self.viewModel = viewModel
    }
}

struct PageView_Previews: PreviewProvider {
    static let viewModel = BasicPageViewModel()
    static var previews: some View {
        PageView(viewModel: viewModel)
    }
}
