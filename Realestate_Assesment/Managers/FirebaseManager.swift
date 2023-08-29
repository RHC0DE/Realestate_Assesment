//
//  Realestate_Assesment
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class FirebaseManager: NSObject {
    
    let auth: Auth
    let storage: Storage
    let fireStore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.fireStore = Firestore.firestore()
        
        super.init()
        
    }
     
}
