//
//  Realestate_Assesment
//


import SwiftUI

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "home")
                .scaledToFit()
                .frame(width: 250, height: 250)
                .foregroundColor(.red)
                .padding()
        }
    }
}
