//
//  Realestate_Assesment
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {

    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .bold()
            .foregroundColor(.primary)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
    
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = Color(Colors.systemRed)) -> some View {
        
        self
            .modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
        
    }
    
}
