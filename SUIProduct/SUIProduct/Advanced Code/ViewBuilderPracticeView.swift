//
//  ViewBuilderPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/11.
//

import SwiftUI

struct HeaderViewRegular:View {
    
    let title: String
    let description: String?
    let iconName: String?
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description{
                Text(description)
                    .font(.callout)
            }
            if let iconName = iconName{
                Image(systemName: iconName)
            }
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderViewGenerice<Content:View>:View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Content:View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        HStack{
            content
        }
    }
}

struct ViewBuilderPracticeView: View {
    var body: some View {
        VStack{
            HeaderViewRegular(title: "New Title", description: "Hello", iconName: "heart.fill")
            HeaderViewRegular(title: "Another Title", description: nil, iconName: nil)
            HeaderViewGenerice(title: "Generice Title") {
                VStack{
                    Text("Hi")
                    Image(systemName: "heart.fill")
                    Text("Hi")
                }
            }
            
            CustomHStack {
                Text("Hi")
                Text("Hi")
            }
            HStack {
                Text("Hi")
                Text("Hi")
            }
//            HeaderViewGenerice(title: "Generice 2", content: Image(systemName: "heart.fill"))
//            HeaderViewGenerice(title: "Generice 3",
//                               content:VStack(content: {
//                Text("Helloooo")
//                Image(systemName: "bolt.fill")
//            })
//            )
            Spacer()
        }
    }
}

#Preview {
    LocalViewBuilder(type: .two)
}


struct LocalViewBuilder:View {
    enum ViewType{
        case one,two,three
    }
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    @ViewBuilder private var headerSection: some View{
        switch type{
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
//        if type == .one{
//            viewOne
//        }else if type == .two{
//            viewTwo
//        }else if type == .three{
//            viewThree
//        }
    }
    
    private var viewOne: some View{
        Text("One!")
    }
    private var viewTwo: some View{
        VStack {
            Text("TWOOOO")
            Image(systemName: "heart.fill")
        }
    }
    private var viewThree: some View{
        Image(systemName: "heart.fill")
    }
}