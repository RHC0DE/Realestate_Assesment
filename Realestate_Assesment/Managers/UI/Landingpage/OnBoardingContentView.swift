//
//  Realestate_Assesment
//

import SwiftUI

struct OnBoardingContentView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @State var feature: Feature
    
    var body: some View {
        
        ZStack {
            Color(Colors.onBoardingColor).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack(spacing: -20) {
                    
                    Text(feature.title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text(feature.subTitle)
                        .font(.body)
                        .lineLimit(5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding()
                    
                }

                Image(feature.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .padding(.bottom, 200)
                
            }
            
            Button(action: {
                self.isOnboarding = false
            }, label: {
                    Text("Get started!")
                        .foregroundColor(.black)
                        .withDefaultButtonFormatting()

            })
            .buttonStyle(PressableButtonStyle())
            .padding(.top, 550)
            .padding()
            
            Button(action: {
                self.dismiss()
            }, label: {
                HStack {
                    Image(systemName: "xmark.app")
                        .foregroundColor(.red)
                    Text("Dismiss")
                        .foregroundColor(.red)
                        .font(.subheadline)
                }
                
            })
            .buttonStyle(PressableButtonStyle())
            .padding(.top, 680)
            .padding()
            
        }

    }
    
}

struct OnBoardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContentView(feature: Feature(title: "The title", subTitle: "Lorim ups dsdosd sdsd sdsds ewe kmkfef kfmekfme dwdef efefef fefefe vbrgt eff tgtgt tbgref wqw qwqwq.", image: "RealestateDetails"))
    }
}
