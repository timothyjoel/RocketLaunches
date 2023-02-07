//
//  LaunchInfoSectionRow.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 07/02/2023.
//

import SwiftUI

struct LaunchInfoSectionRow: View {
    
    var title: String
    var text: String
    var textColor: Color = Color(uiColor: .label)
    
    var body: some View {
        VStack (alignment: .leading) {
            VStack (alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.system(.caption, design: .rounded, weight: .bold))
                        .foregroundColor(Color(uiColor: .systemBlue))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text(text)
                        .font(.system(.caption, design: .rounded, weight: .regular))
                        .foregroundColor(textColor)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    Spacer()
                }
            }
        }
    }
    
}

struct LaunchInfoSectionRow_Previews: PreviewProvider {
    static var previews: some View {
        LaunchInfoSectionRow(title: "Title", text: "Body text")
    }
}
