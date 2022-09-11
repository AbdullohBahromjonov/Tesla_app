//
//  ControlPanelView.swift
//  Tesla_app
//
//  Created by Abdulloh on 15/08/22.
//

import SwiftUI

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

struct ControlPanelView_Preiviews: PreviewProvider {
    static var previews: some View {
        ControlPanelView(title: "Quick Shortcuts", showEdit: false, actionButtonList: quickShortcuts)
            .padding()
            .background(Color.black.opacity(0.92))
            .previewLayout(.sizeThatFits)
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
