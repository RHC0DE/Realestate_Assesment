//
//  Realestate_Assesment
//

import SwiftUI
import CoreLocation
import MapKit


struct RealestateDescription: View {
    
    @State var realestate: Realestate
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack() {
                
                Text("€ " + realestate.priceString)
                    .font(.title2)
                    .foregroundColor(.black)
                    .bold()
                    .padding()
                    .hAlign(.leading)
                
                HStack {
                    
                    HStack(spacing: 3) {
                        Image("bed-2")
                        Text("\(realestate.bedrooms)")
                            .foregroundColor(.black)
                    }
                    
                    HStack(spacing: 5) {
                        Image("shower")
                        Text("\(realestate.bathrooms)")
                            .foregroundColor(.black)
                        
                    }
                    
                    HStack(spacing: 3) {
                        Image("square-measument")
                        Text("\(realestate.size)")
                            .foregroundColor(.black)
                        
                    }
                    
                    HStack(spacing: 2) {
                        Image(systemName: "mappin")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        if let distance = locationManager.convertToKilometersFromUserLocation(latitude: realestate.latitude, longitude: realestate.longitude) {
                            Text("\(distance, specifier: "%.2f") km")
                                .font(.subheadline)
                                .foregroundColor(.black)
                            
                        } else {
                            ProgressView()
                        }
                        
                    }
                    
                }
                
            }
            
            Text("Beschrijving")
                .font(.title2)
                .bold()
                .foregroundColor(.black)
                .padding()
            
            Text("\(realestate.description)")
                .foregroundColor(.gray)
                .padding()
                .padding(.top, -20)
            
            Text("Locatie")
                .font(.title2)
                .bold()
                .foregroundColor(.black)
                .padding()
            
            HStack(alignment: .center) {
               
                Button(action: {
                    // Open Maps app and show the location
                    let coordinate = CLLocationCoordinate2D(latitude: realestate.latitude, longitude: realestate.longitude)
                    let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
                    mapItem.name = "Location Name" // Replace with an appropriate name
                    mapItem.openInMaps(launchOptions: nil)
                }) {
                    MapView(latitude: realestate.latitude, longitude: realestate.longitude)
                        .frame(height: 250)
                        .cornerRadius(5)
                    
                }
                
            }
            .hAlign(.leading)
            .hAlign(.trailing)
            .padding()
            .padding(.top, -20)

            
            HStack {
                
                Link(destination: URL(string: realestate.houseMap)!, label: {
                    Label("Plattegrond details!", systemImage: "house")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(width: 185)
                        .background(Color(Colors.systemRed))
                        .cornerRadius(10)
                    
                })
                .buttonStyle(PressableButtonStyle())
            }
            .hAlign(.trailing)
            .padding()
            
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .all)
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
        
    }
    
}

struct RealestateDescription_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let sampleRealestate = Realestate(id: "1",
                                          imageRealestate: "Logo",
                                          price: 2500.20,
                                          bedrooms: 1,
                                          bathrooms: 1,
                                          size: 44,
                                          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                          houseMap: "Logo",
                                          zip: "1082EA",
                                          city: "Amsterdan",
                                          latitude: 52.325836,
                                          longitude: 4.880179,
                                          createDate: Date())
        RealestateDescription(realestate: sampleRealestate)
        
    }
    
}
