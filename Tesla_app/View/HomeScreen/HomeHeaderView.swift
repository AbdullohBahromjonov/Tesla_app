//
//  HomeHeaderView.swift
//  Tesla_app
//
//  Created by Abdulloh on 15/08/22.
//

import SwiftUI

struct HomeHeaderView: View {
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
        .padding(.top)
    }
}
