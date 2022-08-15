//
//  ContentView.swift
//  Tesla_app
//
//  Created by Abdulloh on 12/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.92)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    HomeHeader()
                    
                    Devider()
                    
                    CarSectionView()
                        
                    ControlPanelView(title: "Quick Shortcuts", showEdit: true, actionButtonList: quickShortcuts)
                    ControlPanelView(title: "Recent Actions", showEdit: false, actionButtonList: recentActions)
                    
                    SettingsView()
                }
            }
            .padding(.horizontal)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GeneralButton: View {
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                image
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.white)
                    .background(Color.white.opacity(0.05))
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(
                                Color.white.opacity(0.5),
                                lineWidth: 0.5
                            )
                    }
            }
        )
        
        
    }
}

struct HomeHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Model 3".uppercased())
                    .font(.caption2)
                    .fontWeight(.medium)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .clipShape(Capsule())
                
                Text("Mach Five")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            HStack {
                GeneralButton(
                    image: Image(systemName: "lock.fill"),
                    action: {
                        print("lock")
                    }
                )
                GeneralButton(
                    image: Image(systemName: "gear"),
                    action: {
                        print("gear")
                    }
                )
            }
        }
        .padding(.top, 30)
    }
}

struct Devider: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.4)
            .foregroundColor(.white.opacity(0.1))
    }
}

struct CarSectionView: View {
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "battery.75")
                    Text("237 miles" .uppercased())
                }
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(Color("Green"))
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Parked")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Text("Last updated: 5 min ago")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
            }
            .padding(.top)
            
            
            Image("tesla model 3")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ControlPanelTitle: View {
    let title: String
    let showEdit: Bool
    
    var body: some View {
        VStack {
            Devider()
            
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
                
                if(showEdit) {
                    Button(
                        action: {},
                        label: {
                            Text("Edit")
                                .foregroundColor(.gray)
                        }
                    )
                }
            }
            
        }
    }
}


struct ControlPanelView: View {
    let title: String
    let showEdit: Bool
    let actionButtonList: [ActionButtonModel]
    @State var selectedItem = 0
    
    var body: some View {
        VStack {
            ControlPanelTitle(title: title, showEdit: showEdit)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(actionButtonList) { item in
                        ActionButton(
                            notActiveImage: item.reverseImage,
                            isActiveImage: item.image,
                            text: item.text,
                            action: {
                                print(item.text)
                            }
                        )
                    }
                }
            }
        }
        .padding(.bottom)
    }
}

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


struct ActionButtonModel: Identifiable {
    let id: Int
    let image: String
    let reverseImage: String
    let text: String
}

let quickShortcuts = [
    ActionButtonModel(id: 1, image: "bolt", reverseImage: "bolt.fill", text: "Charging"),
    ActionButtonModel(id: 2, image: "fanblades", reverseImage: "fanblades.fill", text: "Fan On"),
    ActionButtonModel(id: 3, image: "music.note", reverseImage: "music.note", text: "Media Controls"),
    ActionButtonModel(id: 4, image: "bolt.car", reverseImage: "bolt.car.fill", text: "Close Charge Port")
]

let recentActions = [
    ActionButtonModel(id: 1, image: "arrow.up.square", reverseImage: "arrow.down.app", text: "Open Tunk"),
    ActionButtonModel(id: 2, image: "fanblades", reverseImage: "fanblades.fill", text: "Fan Off"),
    ActionButtonModel(id: 3, image: "person.fill.viewfinder", reverseImage: "person.fill.viewfinder", text: "Summon")
]

struct SettingsView: View {
    var body: some View {
        VStack {
            ControlPanelTitle(title: "All Settings", showEdit: false)
            LazyVGrid (columns: [GridItem(.adaptive(minimum: 130, maximum: 180)), GridItem(.adaptive(minimum: 130, maximum: 180))]) {
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

struct SettingBlock: View {
    let image: String
    let text: String
    let subtitle: String
    let hasSubtitle: Bool
    
    var body: some View {
        
        Button(
            action: {},
            label: {
                HStack {
                    Image(systemName: image)
                        //.imageScale(.large)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(text)
                            .fontWeight(.semibold)
                            .font(.system(size: 16,weight: .medium, design: .default))
                            .foregroundColor(.white)
                        
                        if hasSubtitle {
                            Text(subtitle)
                                .font(.system(size: 8, weight: .medium, design: .default))
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
                            Color.white.opacity(0.5),
                            lineWidth: 0.5
                        )
                )
            }
        )
    }
}
