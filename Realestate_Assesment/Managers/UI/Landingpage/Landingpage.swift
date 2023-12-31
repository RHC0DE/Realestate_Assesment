//
//  Realestate_Assesment
//

import SwiftUI

struct Landingpage: View {
    
    @ObservedObject var onboardingViewModel = OnBoardingViewModel()
    
    var body: some View {
        
        ZStack {
            Color(Colors.onBoardingColor).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text(Strings.landingpageTitle)
                    .foregroundColor(.black)
                    .bold()
                    .font(.italic(.title)())
                    .padding(.bottom, 130)
                
                Image("Landingpage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                
                
                Text(Strings.landingpageBody)
                    .foregroundColor(.black)
                    .font(.italic(.body)())
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button(action: {
                    self.onboardingViewModel.showOnBoardingView.toggle()
                    
                }, label: {
                    
                    Text(Strings.letsGoBtnTitle)
                        .foregroundColor(.black)
                        .withDefaultButtonFormatting()

                    
                })
                .buttonStyle(PressableButtonStyle())
                .padding(.top, 160)
                .padding()
            }
            
            
        }
        .fullScreenCover(isPresented: self.$onboardingViewModel.showOnBoardingView, content: OnBoardingContainerView.init)
    }
    
}

struct Landingpage_Previews: PreviewProvider {
    static var previews: some View {
        Landingpage()
    }
}

extension View {
    
    func vAlign(_ alignment: Alignment) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func hAlign(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
}
