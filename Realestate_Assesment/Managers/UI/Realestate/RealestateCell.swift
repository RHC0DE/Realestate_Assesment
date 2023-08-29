//
//  Realestate_Assesment
//

import SwiftUI

struct RealestateCell : View {
    
    @State var realestate: Realestate
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        
        HStack {
            
            AsyncImage(url: URL(string: realestate.imageRealestate)) { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .cornerRadius(15)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                
                Text("€ " + realestate.priceString)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                
                HStack {
                    Text(realestate.zip + realestate.city)
                        .foregroundColor(Color(red: 0.596, green: 0.596, blue: 0.596))
                }
                
                HStack (alignment: .bottom) {
                    
                    HStack(spacing: 5) {
                        Image("bed-2")
                        Text("\(realestate.bedrooms)")
                            .font(.subheadline)
                    }
                    
                    HStack(spacing: 5) {
                        Image("shower")
                        Text("\(realestate.bathrooms)")
                            .font(.subheadline)
                    }
                    
                    HStack(spacing: 5) {
                        Image("square-measument")
                        Text("\(realestate.size)")
                            .font(.subheadline)
                    }
                    
                    HStack(spacing: 2) {
                        Image(systemName: "mappin")
                            .font(.subheadline)
                        if let distance = locationManager.convertToKilometersFromUserLocation(latitude: realestate.latitude, longitude: realestate.longitude) {
                            Text("\(distance, specifier: "%.2f") km")
                                .font(.subheadline)
                        } else {
                            ProgressView()
                        }
                        
                    }
                    
                }.foregroundColor(.secondary)
                
            }
            
        }
        .hAlign(.leading)
        
    }

    
}

//struct RealestateCell_Previews: PreviewProvider {
//    static var previews: some View {
//        RealestateCell()
//    }
//}
