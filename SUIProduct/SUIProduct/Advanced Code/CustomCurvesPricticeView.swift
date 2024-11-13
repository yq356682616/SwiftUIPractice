//
//  CustomCurvesPricticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/11.
//

import SwiftUI
//曲线
struct CustomCurvesPricticeView: View {
    var body: some View {
        WaterShape()
//            .stroke(lineWidth: 5)
//            .frame(width: 200, height: 200)
//            .rotationEffect(Angle(degrees: 90))
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.red, .blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .ignoresSafeArea()
    }
}

#Preview {
    CustomCurvesPricticeView()
}
//画弧
struct ArcSample: Shape{
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 40),
                clockwise: true
            )
        }
    }
}

struct ShapeWithArc: Shape{
    func path(in rect: CGRect) -> Path {
        Path { path in
            //top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            //top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            //mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            //bottom
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            //mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
    }
}

//四面曲线
struct QuadSample: Shape{
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY),
                              control: CGPoint(x: rect.maxX - 50, y: rect.minY - 100))
        }
    }
}

struct WaterShape: Shape{
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.4))
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.6))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: .zero)
        }
    }
}
