//
//  PhotoPlaceholder.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 07/02/2023.
//

import SwiftUI

struct PhotoPlaceholder: View {
    
    var body: some View {
        ZStack (alignment: .center) {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
    }
    
}

struct PhotoPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPlaceholder()
    }
}
