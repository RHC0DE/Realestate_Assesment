//
//  Realestate_Assesment
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var viewModel: RealestateViewModel
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                List(self.viewModel.realestates) { realestate in
                    
                    Section {
                        NavigationLink(destination: RealestateDetail(realestate: realestate)) {
                            RealestateCell(realestate: realestate)

                        }
                        
                    }.foregroundColor(.clear)
                    
                }
                .listStyle(.insetGrouped)

            }
            .vAlign(.top)
            .navigationBarTitle(Text("Real estates"), displayMode: .automatic)
            .navigationBarBackButtonHidden(true)
            .onAppear() {
                self.viewModel.fetchAllRealestates()
            }
            .onAppear(perform: locationManager.requestLocation)


        }
        .searchable(text: self.$viewModel.searchQuery)

    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RealestateViewModel())
    }
}
