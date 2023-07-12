//
//  Realestate_Assesment
//

import Foundation

struct Realestate: Identifiable {
    
    var id: String
    var imageRealestate: String
    var price: Double
    var priceString: String {
        let formattedString = String(format: "%.2f", price)
        return formattedString
    }
    var bedrooms: Int
    var bathrooms: Int
    var size: Int
    var description: String
    var zip: String
    var city: String
    var latitude: Double
    var longitude: Double
    var createDate: Date
    var createDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: createDate)
    }
    
}
