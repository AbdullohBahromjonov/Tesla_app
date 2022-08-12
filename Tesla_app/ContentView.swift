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
                        
                    ControlPanelView(title: "Quick Shortcuts", showEdit: true)
                    ControlPanelView(title: "Recent Actions", showEdit: false)
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
        .padding(.top, 50)
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
    
    var body: some View {
        VStack {
            ControlPanelTitle(title: title, showEdit: showEdit)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ActionButton(image: "bolt.fill", action: {}, text: "Charging")
                    ActionButton(image: "fanblades.fill", action: {}, text: "Fan On")
                    ActionButton(image: "music.note", action: {}, text: "Media Controls")
                    ActionButton(image: "bolt.car", action: {}, text: "Close Charge Port")
                }
            }
        }
    }
}

struct ActionButton: View {
    let image: String
    let action: () -> Void
    let text: String
    
    var body: some View {
        VStack(alignment: .center) {
            GeneralButton(image: Image(systemName: image), action: action)
            Text(text)
                .frame(width: 72, height: .infinity)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
    }
}
