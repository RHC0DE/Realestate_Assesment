//
//  Realestate_Assesment
//

import Foundation
import SwiftUI

class OnBoardingViewModel: ObservableObject {
    
    @Published var showOnBoardingView: Bool = false
    @Published var features: [Feature] = [Feature(title: "Find a home that suits you best", subTitle: "A large number of properties are offered to ensure that the user has enough choice to choose what best suits their needs and requirements.", image: "RealestateItem"), Feature(title: "Get an enriching insight into the details of the selected house", subTitle: "On this page all the details of the house are displayed. It also displays the location of the house on a small map.", image: "RealestateDetails"), Feature(title: "Customize your home search", subTitle: "Seach a home based by price, ZIP code, number of bedrooms and bathrooms, distance from current location and more.", image: "SearchRealesate")]
    
}
