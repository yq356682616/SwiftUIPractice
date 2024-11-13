//
//  ScrollViewPreferenceKeyPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/12.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey:PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View{
    func onScrollViewOffsetChange(action: @escaping (_ offset: CGFloat) -> Void) -> some View{
        self
            .background(
                GeometryReader(content: { geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                })
            )
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                action(value)
            }
    }
}

struct ScrollViewPreferenceKeyPracticeView: View {
    
    let title: String = "New Title here!!!"

    @State private var scrollViewOffset: CGFloat = 0
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(scrollViewOffset / 63)
                    .onScrollViewOffsetChange { offset in
                        self.scrollViewOffset = offset
                    }
                contentLayer
            }
            .padding()
        }
        .overlay(content: {
            Text("\(scrollViewOffset)")
        })
        .overlay(alignment: .top) {
            navBarLayer
                .opacity(scrollViewOffset < 40 ? 1.0 : 0)
        }
    }
}

#Preview {
    ScrollViewPreferenceKeyPracticeView()
}

extension ScrollViewPreferenceKeyPracticeView{
    private var titleLayer: some View{
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var contentLayer: some View{
        ForEach(0..<30) { _ in
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300,height: 200)
        }
    }
    private var navBarLayer: some View{
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.blue)
    }
}
