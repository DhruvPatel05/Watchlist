//
//  PageTabView.swift
//  Watchlist
//
//  Created by Dhruv Patel on 01/06/26.
//

import SwiftUI

struct PageTabView: View {
    var icon: String
    var description: String
    
    var body: some View {
        VStack(spacing:8){
            Image(systemName: icon)
                .imageScale(.large)
                .font(.largeTitle.weight(.light))
            Text(description)
                .font(.title.weight(.light))
                .fontWidth(.compressed)
                .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    PageTabView(icon: "1.circle", description: "Add some moview to the watchlist if you plan to wathch later")
        .padding()
}
