//
//  ContentView.swift
//  Tesla_app
//
//  Created by Abdulloh on 12/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.opacity(0.92)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HomeHeaderView()
                            
                        Devider()
                                
                        CarSectionView()
                                    
                        ControlPanelView(title: "Quick Shortcuts", showEdit: true, actionButtonList: quickShortcuts)
                        ControlPanelView(title: "Recent Actions", showEdit: false, actionButtonList: recentActions)
                            
                        SettingsView()
                                .padding(.bottom)
                    }
                }
                .padding(.horizontal)
                
                VoiceCommandButton()
               
            }
            .navigationTitle("Mach Five")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ActionButtonModel: Identifiable {
    let id: Int
    let image: String
    let reverseImage: String
    let text: String
}

let quickShortcuts = [
    ActionButtonModel(id: 1, image: "bolt", reverseImage: "bolt.fill", text: "Charge"),
    ActionButtonModel(id: 2, image: "fanblades", reverseImage: "fanblades.fill", text: "Fan"),
    ActionButtonModel(id: 3, image: "music.note", reverseImage: "music.note", text: "Media Controls"),
    ActionButtonModel(id: 4, image: "bolt.car", reverseImage: "bolt.car.fill", text: "Charge Port")
]

let recentActions = [
    ActionButtonModel(id: 1, image: "arrow.up.square", reverseImage: "arrow.down.app", text: "Tunk"),
    ActionButtonModel(id: 2, image: "fanblades", reverseImage: "fanblades.fill", text: "Fan"),
    ActionButtonModel(id: 3, image: "person.fill.viewfinder", reverseImage: "person.fill.viewfinder", text: "Summon")
]
