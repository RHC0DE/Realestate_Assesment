//
//  NoResultImage.swift
//  Realestate_Assesment
//
//  Created by Guest User on 25/09/2023.
//

import SwiftUI

struct NoResultImage: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("empty")
                .scaledToFill()
                .frame(width: 150, height: 150)
                .padding()
            Text("Geen resultaten gevonden!")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 70)
            
            Text("Misschien een andere zoekopdracht proberen?")
                .font(.headline)
                .foregroundColor(.gray)
            
            Spacer() 
        }
    }
}

struct NoResultImage_Previews: PreviewProvider {
    static var previews: some View {
        NoResultImage()
    }
}
