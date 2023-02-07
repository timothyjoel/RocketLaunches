//
//  ChildViewSizeReader.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 06/02/2023.
//

import SwiftUI

struct ChildViewSizeReader<Content: View>: View {
    
    @Binding var size: CGSize
    let content: () -> Content
    
    var body: some View {
        ZStack {
            content()
                .background(GeometryReader { proxy in
                        Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size) })
        }
        .onPreferenceChange(SizePreferenceKey.self) { preferences in
            self.size = preferences
        }
    }
    
}

struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    static var defaultValue: Value = .zero
    static func reduce(value _: inout Value, nextValue: () -> Value) { _ = nextValue() }
}
