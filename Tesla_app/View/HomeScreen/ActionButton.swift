//
//  ActionButton.swift
//  Tesla_app
//
//  Created by Abdulloh on 15/08/22.
//

import SwiftUI

struct ActionButton: View {
    let notActiveImage: String
    let isActiveImage: String
    let text: String
    var color = Color.white.opacity(0.05)
    let action: () -> Void
    @State var isActive = false
    
    
    var body: some View {
        VStack(alignment: .center) {
            GeneralButton(
                image: Image(systemName: isActive ? isActiveImage : notActiveImage),
                action: {
                    isActive.toggle()
                },
                color: color
            )
            Text(isActive ? text : text)
                .frame(width: 72)
                .fixedSize()
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(notActiveImage: "fanblades.fill", isActiveImage: "fanblades", text: "Fan", action: {})
            .padding()
            .background(Color.black.opacity(0.92))
            .previewLayout(.sizeThatFits)
    }
}
