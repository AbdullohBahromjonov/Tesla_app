//
//  CarControlsView.swift
//  Tesla_app
//
//  Created by Abdulloh on 31/08/22.
//

import SwiftUI

struct CarControlsView: View {
    @State var valetMode = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.92)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
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
                        Text("Car Controls")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        
                    }
                    Devider()
                    
                    CarLockButton()
                        .padding(.vertical)
                    
                    Devider()
                    
                    VStack(spacing: 30) {
                        HStack(spacing: 40) {
                            ActionButton(notActiveImage: "flashlight.off.fill", isActiveImage: "flashlight.on.fill", text: "Flash", action: {})
                            ActionButton(notActiveImage: "speaker.wave.3.fill", isActiveImage: "speaker.wave.3.fill", text: "Honk", action: {})
                            ActionButton(notActiveImage: "key.fill", isActiveImage: "key.fill", text: "Start", action: {})
                        }
                        
                        HStack(spacing: 40) {
                            ActionButton(notActiveImage: "arrow.up.bin", isActiveImage: "arrow.up.bin", text: "Front Trunk", action: {})
                            ActionButton(notActiveImage: "arrow.up.square", isActiveImage: "arrow.down.square", text: "Trunk", action: {})
                        }
                    }
                    .padding()
                    
                    Devider()
                    
                    HStack {
                        Toggle(
                            isOn: $valetMode,
                            label: {
                                Text("Valet Mode")
                                    .foregroundColor(.white)
                            }
                        )
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        
    }
}

struct CarControlsView_Previews: PreviewProvider {
    static var previews: some View {
        CarControlsView()
    }
}

struct CarLockButton: View {
    @State private var isCarLocked = false
    
    var body: some View {
        Button(
            action: {
                isCarLocked.toggle()
            },
            label: {
                HStack {
                    Image(systemName: isCarLocked ? "lock.open.fill" : "lock.fill")
                        .foregroundColor(.white)
                    
                    Text(isCarLocked ? "Lock Car" : "Unlcok Car")
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
                )
            }
        )
    }
}
