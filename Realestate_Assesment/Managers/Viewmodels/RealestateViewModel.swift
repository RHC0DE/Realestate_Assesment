//
//  Realestate_Assesment
//

import Foundation
import Firebase

class RealestateViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var searchQuery = ""
    @Published var realestates = [Realestate]()
    @Published var realestate: Realestate?
    
    
    // MARK: - Functions

    init() {
        fetchAllRealestates()
    }
    
    func fetchAllRealestates() {

        FirebaseManager.shared.fireStore.collection("Realestates").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Failed to fetch Real Estates")
                return
            }

            self.realestates = documents.map { querySnapshot -> Realestate in
                let data = querySnapshot.data()
                let id = data["id"] as? String ?? ""
                let imageRealestate = data["imageRealestate"] as? String ?? ""
                let price = data["price"] as? Double ?? 0.0
                let bedrooms = data ["bedrooms"] as? Int ?? 0
                let bathrooms = data ["bathrooms"] as? Int ?? 0
                let size = data ["size"] as? Int ?? 0
                let description = data["description"] as? String ?? ""
                let houseMap = data["houseMap"] as? String ?? ""
                let zip = data["zip"] as? String ?? ""
                let city = data["city"] as? String ?? ""
                let latitude = data["latitude"] as? Double ?? 0.0
                let longitude = data["longitude"] as? Double ?? 0.0
                let createDate = (data["createDate"] as? Timestamp)?.dateValue() ?? Date()

                return Realestate(id: id, imageRealestate: imageRealestate, price: price, bedrooms: bedrooms, bathrooms: bathrooms, size: size, description: description, houseMap: houseMap, zip: zip, city: city, latitude: latitude, longitude: longitude, createDate: createDate)
            }

        }

    }
    
}
