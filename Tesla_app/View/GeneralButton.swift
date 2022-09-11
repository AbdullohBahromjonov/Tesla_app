//
//  GeneralButton.swift
//  Tesla_app
//
//  Created by Abdulloh on 15/08/22.
//

import SwiftUI

struct GeneralButton: View {
    let image: Image
    let action: () -> Void
    var color = Color.white.opacity(0.05)
    
    
    var body: some View {
        Button(
            action: action,
            label: {
                image
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.white)
                    .background(color)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(
                                Color.white.opacity(0.1),
                                lineWidth: 0.5
                            )
                    }
            }
        )
    }
}
