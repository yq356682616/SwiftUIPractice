//
//  ProtocolsPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/17.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol{
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

struct AnotherColorTheme: ColorThemeProtocol{
    var primary: Color = .blue
    var secondary: Color = .red
    var tertiary: Color = .purple
    
}

protocol ColorThemeProtocol{
    var primary: Color { get }//可以设置set
    var secondary: Color { get }
    var tertiary: Color { get }
}



protocol ButtonTextProtocol{
    var buttonText: String {get}
}

protocol ButtonPressedProtocol{
    func buttonPressed()
}
protocol ButtonDataSourceProtocol: ButtonTextProtocol, ButtonPressedProtocol{
    
}
class DefaultDataSource: ButtonDataSourceProtocol{
    var buttonText: String = "Protocols are awesome!"
    func buttonPressed(){
        print("Button was pressed!")
    }
}
class AlternativeDataSource: ButtonTextProtocol{
    var buttonText: String = "Protocols are lame!"
}
struct ProtocolsPracticeView: View {
    let colorTheme: ColorThemeProtocol
    let dataSource: ButtonDataSourceProtocol
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

#Preview {
    ProtocolsPracticeView(colorTheme: DefaultColorTheme(), dataSource: DefaultDataSource())
}
