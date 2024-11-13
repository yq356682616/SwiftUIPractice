//
//  GeometryPreferenceKeyPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/12.
//

import SwiftUI
//反向给父视图传值
struct GeometryPreferenceKeyPracticeView: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(width: rectSize.width,height: rectSize.height)
                .background(.blue)
            Spacer()
            HStack {
                Rectangle()
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                }
                Rectangle()
            }
            .frame(height: 150)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { value in
            self.rectSize = value
        }
    }
}

#Preview {
    GeometryPreferenceKeyPracticeView()
}
extension View{
    func updateRectangleGeoSize(_ size: CGSize) -> some View{
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}
struct RectangleGeometrySizePreferenceKey: PreferenceKey{
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
}
