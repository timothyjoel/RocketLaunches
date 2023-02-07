//
//  CustomScrollView.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 06/02/2023.
//

import SwiftUI

/// This scrollview allows to detect scroll to bottom actions
struct CustomScrollView<Content: View>: View {
    
    @Binding var didScrollToBottom: Bool
    let content: () -> Content
    
    private let spaceName = "scroll"
    @State private var wholeSize: CGSize = .zero
    @State private var contentSize: CGSize = .zero
    
    var body: some View {
        
        ChildViewSizeReader(size: $wholeSize) {
            VStack(spacing: 0) {
                ScrollView {
                    ChildViewSizeReader(size: $contentSize) {
                        content()
                            .background(GeometryReader { proxy in
                                Color.clear
                                    .preference(key: ViewOffsetKey.self,
                                                value: -1 * proxy.frame(in: .named(spaceName)).origin.y)
                            })
                            .onPreferenceChange(ViewOffsetKey.self) { offset in
                                DispatchQueue.main.async {
                                    didScrollToBottom = offset >= contentSize.height - wholeSize.height
                                }
                            }
                    }
                }
                .coordinateSpace(name: spaceName)
            }
        }
        
    }
    
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: Value = .zero
    static func reduce(value: inout Value, nextValue: () -> Value) { value += nextValue() }
}
