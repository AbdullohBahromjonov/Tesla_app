//
//  CarSectionView.swift
//  Tesla_app
//
//  Created by Abdulloh on 15/08/22.
//

import SwiftUI

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
