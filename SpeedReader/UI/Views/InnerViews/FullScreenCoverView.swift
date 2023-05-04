//

import SwiftUI

struct FullScreenCoverView: View {
    
    @ObservedObject private var viewModel: BasicPageViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Text("FullScreenCoverView")
                Button("Dismiss") {
                    viewModel.dismissFullCover()
                }
            }
        }
    }
    
    init(viewModel: BasicPageViewModel) {
        self.viewModel = viewModel
    }
}

struct FullScreenCoverView_Previews: PreviewProvider {
    static let viewModel = BasicPageViewModel()
    static var previews: some View {
        FullScreenCoverView(viewModel: viewModel)
    }
}
