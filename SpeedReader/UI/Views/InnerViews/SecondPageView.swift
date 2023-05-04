import SwiftUI

struct SecondPageView: View {
    
    @ObservedObject private var viewModel: BasicPageViewModel
    
    var body: some View {
        NavigationView {
            Text("Second Page")
        }
    }
    
    init(viewModel: BasicPageViewModel) {
        self.viewModel = viewModel
    }
}

struct SecondPageView_Previews: PreviewProvider {
    static let viewModel = BasicPageViewModel()
    static var previews: some View {
        SecondPageView(viewModel: viewModel)
    }
}
