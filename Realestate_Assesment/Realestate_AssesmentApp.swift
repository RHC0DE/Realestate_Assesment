//
//  Realestate_Assesment
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
    
}

@main
struct Realestate_AssesmentApp: App {
    @AppStorage("isOnboarding") var isOnboarding =  true
    
    init() {
        FirebaseApp.configure()
    }
    
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
