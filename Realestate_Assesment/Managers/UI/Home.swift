//
//  Realestate_Assesment
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var viewModel: RealestateViewModel

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("Hello, World!")

            }
            .vAlign(.top)
            .navigationBarTitle(Text("Real estates"), displayMode: .automatic)
            .navigationBarBackButtonHidden(true)

        }
        .searchable(text: self.$viewModel.searchQuery)

    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RealestateViewModel())
    }
}
