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
    @State var isActive = false
    let text: String
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            GeneralButton(
                image: Image(systemName: isActive ? isActiveImage : notActiveImage),
                action: {
                    isActive.toggle()
                }
            )
            Text(text)
                .frame(width: 72)
                .fixedSize()
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
    }
}
