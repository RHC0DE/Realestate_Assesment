//
//  Realestate_Assesment
//

import SwiftUI

@main
struct Realestate_AssesmentApp: App {
    @AppStorage("isOnboarding") var isOnboarding =  true
    
    var body: some Scene {
        
        WindowGroup {
            
            let viewModel = RealestateViewModel()
            
            if isOnboarding {
                
                Landingpage()
                
            } else {
                
                ContentView()
                    .environmentObject(viewModel)
                
            }
            
        }
        
    }
    
}
