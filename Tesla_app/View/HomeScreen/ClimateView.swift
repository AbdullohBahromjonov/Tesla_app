//
//  ClimateView.swift
//  Tesla_app
//
//  Created by Abdulloh on 10/09/22.
//

import SwiftUI

struct ClimateView: View {
    @State private var celsius: Double = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.92)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    HStack() {
                        GeneralButton(
                            image: Image(systemName: "chevron.left"),
                            action: {
                                presentationMode.wrappedValue.dismiss()
                            }
                        )
                        Spacer()
                    }
                    Text("Climate Controls")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Devider()
                }
                
                VStack {
                    HStack {
                        Image(systemName: "snowflake")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            
                        Spacer()
                        
                        Image(systemName: "sun.max")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                    
                    Slider(value: $celsius, in: -16...16)
                        
                    
                }
                    
                
                ZStack {
                    Image("tesla top view")
                    
                    VStack {
                        HStack(spacing: 30) {
                            ActionButton(notActiveImage: "fanblades", isActiveImage: "fanblades.fill", text: "", color: Color.black.opacity(0.7), action: {})
                            ActionButton(notActiveImage: "fanblades", isActiveImage: "fanblades.fill", text: "", color: Color.black.opacity(0.7), action: {})
                        }
                        .padding(.top, 200)
                        Spacer()
                    }
                    
                }
                
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        
    }
}

struct ClimateView_Previews: PreviewProvider {
    static var previews: some View {
        ClimateView()
    }
}
