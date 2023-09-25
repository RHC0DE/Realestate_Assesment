//
//  Realestate_Assesment
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        
        ZStack {
            
            Color(Colors.onBoardingColor).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Over")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                }
                .padding()
                .hAlign(.leading)
                
                Text("Ontdek je ideale huis met de Realestate app®. We tonen in eerste instantie de huurprijs, maar je kunt ook de koopprijs of geschatte waarde van beschikbare woningen bekijken. Of je nu op zoek bent naar een huurwoning, een koopwoning, of gewoon nieuwsgierig bent naar de geschatte waarde van een huis, de Realestate app maakt het zoekproces aangenaam en moeiteloos. Met behulp van een variatie van betrouwbare tools begeleid deze applicatie gebruikers stap voor stap, zodat ze een grootschalige collectie aan beschikbare woningen kunnen doorzoeken en uiteindelijk het perfecte huis uitkiezen dat aan alle wensen voldoet.")
                    .padding()
                    .fontWeight(.thin)
                    .foregroundColor(.black)
                
                Text("Realestate app®")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                
                HStack {
                    
                    Image("Landingpage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 100)
                        .padding()
                        .padding(.top, -50)
                    
                    VStack {
                        
                        Link(destination: URL(string: "https://github.com/RHC0DE/Realestate_Assesment")!, label: {
                            Label("by RHC0DE", systemImage: "link")
                                .fontWeight(.thin)
                                .foregroundColor(.black)
                            
                        })
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
