//
//  Realestate_Assesment
//

import SwiftUI

struct Landingpage: View {
    
    @ObservedObject var onboardingViewModel = OnBoardingViewModel()
    
    var body: some View {
        
        ZStack {
            Color(Colors.systemGray).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("A Home Changes Everything")
                    .bold()
                    .font(.italic(.title)())
                    .padding(.bottom, 130)
                
                Image("Landingpage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                
                
                Text("Go through this quick setup to get the most out of this app.")
                    .foregroundColor(.black)
                    .font(.italic(.body)())
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button(action: {
                    self.onboardingViewModel.showOnBoardingView.toggle()
                    
                }, label: {
                    
                    Text("Let's Go!")
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
