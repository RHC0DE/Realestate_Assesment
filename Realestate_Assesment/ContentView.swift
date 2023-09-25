//
//  Realestate_Assesment
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: RealestateViewModel

    var body: some View {
        
        NavigationView {
            
            TabView {
                
                Home()
                    .tabItem {
                        Label("", systemImage: "house")
                    }
                
                AboutView()
                    .tabItem {
                        Label("", systemImage: "info.circle.fill")
                    }
                
            }
            .onAppear() {
                UITabBar.appearance().barTintColor = .secondarySystemBackground
            }
            .navigationBarHidden(true)
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(RealestateViewModel())

    }
}
