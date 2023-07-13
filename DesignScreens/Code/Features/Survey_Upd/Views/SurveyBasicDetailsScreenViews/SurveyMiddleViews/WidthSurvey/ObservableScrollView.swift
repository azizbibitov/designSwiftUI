//
//  ObservableScrollView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 13.07.2023.
//

import SwiftUI

// Simple preference that observes a CGFloat.
struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

// A ScrollView wrapper that tracks scroll offset changes.
struct ObservableScrollView<Content>: View where Content : View {
    @Namespace var scrollSpace
    @State var width: CGFloat = 0
    @Binding var scrollOffset: CGFloat
    let content: (ScrollViewProxy) -> Content
    
    init(scrollOffset: Binding<CGFloat>,
         @ViewBuilder content: @escaping (ScrollViewProxy) -> Content) {
        _scrollOffset = scrollOffset
        self.content = content
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            ScrollViewReader { proxy in
                content(proxy)
                    .background(GeometryReader { geo in
                        let offset = -geo.frame(in: .named(scrollSpace)).origin.x
                        
                        Color.clear
                            .preference(key: ScrollViewOffsetPreferenceKey.self,
                                        value: offset)
                    })
            }
        }
        .coordinateSpace(name: scrollSpace)
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            scrollOffset = value
        }
    }
}
