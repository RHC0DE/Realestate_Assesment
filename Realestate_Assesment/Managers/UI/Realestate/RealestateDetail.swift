//
//  Realestate_Assesment
//

import SwiftUI

struct RealestateDetail: View {
    
    // MARK: - Property's
    @ObservedObject private var locationManager = LocationManager()
    @State private var realestate: Realestate
    
    public init(realestate: Realestate) {
        self._realestate = State(initialValue: realestate)
    }
    
    // MARK: - UI
    var body: some View {
                
        ZStack {
            
            Color.white
            
            ScrollView  {
                
                // Realestate image
                AsyncImage(url: URL(string: realestate.imageRealestate)) { returnedImage in
                    
                    returnedImage
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .clipped()
                    
                } placeholder: {
                    ProgressView()
                    
                }
                
                // Realestate description data
                RealestateDescription(realestate: realestate)

            }
            .edgesIgnoringSafeArea(.top)

        }
        
    }
    
}

struct RealestateDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let sampleRealestate = Realestate(id: "1",
                                          imageRealestate: "Logo",
                                          price: 2500.20,
                                          bedrooms: 1,
                                          bathrooms: 1,
                                          size: 44,
                                          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
                                          houseMap: "Logo",
                                          zip: "1082EA",
                                          city: "Amsterdan",
                                          latitude: 52.325836,
                                          longitude: 4.880179,
                                          adressName: "Kastelenstraat 105",
                                          createDate: Date())
        RealestateDetail(realestate: sampleRealestate)
        
    }
    
}
