//
//  Realestate_Assesment
//

import SwiftUI

struct About: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text(Strings.aboutHeader)
                    .font(.title)
                    .bold()
                    .foregroundColor(.primary)
            }
            .padding()
            .hAlign(.leading)
            
            Text(Strings.aboutBody)
                .padding()
                .fontWeight(.thin)
                .foregroundColor(.primary)
            
            Text(Strings.realestateAppHeader)
                .font(.title)
                .bold()
                .foregroundColor(.primary)
                .padding()
            
            Text(Strings.appVersion)
                .fontWeight(.thin)
                .foregroundColor(.primary)
                .bold()
                .padding()
            
            Link(destination: URL(string: Strings.gitLink)!, label: {
                Label(Strings.byRHC0DELabel, systemImage: "link")
                    .fontWeight(.thin)
                    .foregroundColor(.primary)
                
            })
            .padding()
            
        }
        
    }
    
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
