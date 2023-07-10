//
//  Realestate_Assesment
//

import SwiftUI

@main
struct Realestate_AssesmentApp: App {
    @AppStorage("isOnboarding") var isOnboarding =  true
    
    var body: some Scene {
        
        WindowGroup {
            
            if isOnboarding {
                
                Landingpage()
                
            } else {
                
                ContentView()
                
            }
            
        }
        
    }
    
}
