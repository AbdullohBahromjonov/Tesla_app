//
//  SettingsView.swift
//  Tesla_app
//
//  Created by Abdulloh on 15/08/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            ControlPanelTitle(title: "All Settings", showEdit: false)
            LazyVGrid (columns: [GridItem(.adaptive(minimum: 130, maximum: 180)), GridItem(.adaptive(minimum: 130, maximum: 180))]) {
                
                NavigationLink(destination: CarControlsView()) {
                    SettingBlock(image: "car.fill", text: "Controls", subtitle: "car locked".uppercased(), hasSubtitle: true)
                }
                SettingBlock(image: "car.fill", text: "Controls", subtitle: "car locked".uppercased(), hasSubtitle: true)
                SettingBlock(image: "fanblades.fill", text: "Climate", subtitle: "interior 68C".uppercased(), hasSubtitle: true)
                SettingBlock(image: "location.fill", text: "Location", subtitle: "empire state building".uppercased(), hasSubtitle: true)
                SettingBlock(image: "checkerboard.shield", text: "Security", subtitle: "0 events detected".uppercased(), hasSubtitle: true)
                SettingBlock(image: "sparkles", text: "Updates", subtitle: "3 updates available".uppercased(), hasSubtitle: true)
            }
            
            
            Button (
                action: {},
                label: {
                    Text("Reorder groups")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .foregroundColor(.white)
                        .background(Color.white.opacity(0.05))
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(0.5), lineWidth: 0.5)
                        )
                }
            )
            .padding(.top)
        }
    }
}

struct SettingsView_Preivews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .padding()
            .background(Color.black.opacity(0.9))
            .previewLayout(.sizeThatFits)
    }
    
}

struct SettingBlock: View {
    let image: String
    let text: String
    let subtitle: String
    let hasSubtitle: Bool
    
    var body: some View {
        HStack {
            Image(systemName: image)
                //.imageScale(.large)
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(text)
                    .fontWeight(.semibold)
                    .font(.system(size: 14,weight: .medium, design: .default))
                    .foregroundColor(.white)
                
                if hasSubtitle {
                    Text(subtitle)
                        .font(.system(size: 7, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.white.opacity(0.05))
            )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(
                    Color.white.opacity(0.1),
                    lineWidth: 0.5
                )
        )
    }
}

