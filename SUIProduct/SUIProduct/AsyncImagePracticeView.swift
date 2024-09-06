//
//  AsyncImagePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/6.
//

import SwiftUI

struct AsyncImagePracticeView: View {
    
    let url = URL(string: "https://picsum.photos/400")
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            case .failure(let error):
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
        
        
        
//        AsyncImage(url: url, content: { returnImage in
//            returnImage
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100,height: 100)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//        }, placeholder: {
//            ProgressView()
//        })
    }
}

#Preview {
    AsyncImagePracticeView()
}
