//
//  Realestate_Assesment
//

import SwiftUI

struct OnBoardingContainerView: View {

    @ObservedObject var viewModel = OnBoardingViewModel()

    var body: some View {
        
        TabView {
            
            ForEach(viewModel.features) { feature in
                
                OnBoardingContentView(feature: feature)
                
            }
                        
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .edgesIgnoringSafeArea(.all)
        
        
    }
    
}

struct OnBoardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContainerView()
    }
}
