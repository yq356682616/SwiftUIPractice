//
//  CustomShapesPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/11.
//

import SwiftUI
//可以画不同形状
struct Triangle:Shape{
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxX))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxX))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }

}
struct Dimond: Shape{
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}
//梯形
struct Trapezoid: Shape{
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
        }
    }
}

struct CustomShapesPracticeView: View {
    var body: some View {
        ZStack {
//            Image("pic")
//                .resizable()
//                .scaledToFill()
//            Triangle()
            Trapezoid()
//                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round,dash: [10]))
//                .foregroundStyle(.blue)
//                .trim(from: 0, to: 0.5)
//                .fill(LinearGradient(colors: [.red,.blue], startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 100)
//                .clipShape(Triangle().rotation(Angle(degrees: 180)))
        }
    }
}

#Preview {
    CustomShapesPracticeView()
}
