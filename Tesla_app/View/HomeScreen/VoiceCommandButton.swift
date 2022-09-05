//
//  VoiceCommandButton.swift
//  Tesla_app
//
//  Created by Abdulloh on 15/08/22.
//

import SwiftUI

struct VoiceCommandButton: View {
    var body: some View {
        HStack() {
            Spacer()
            
            Button(
                action: {},
                label: {
                    Image(systemName: "mic.fill")
                        .padding()
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .background(Color("Green"))
                        .clipShape(Circle())
                }
            )
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.bottom)
    }
}

