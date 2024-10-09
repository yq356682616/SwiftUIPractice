//
//  DownloadingImageView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/29.
//

import SwiftUI

struct DownloadingImageView: View {
    @StateObject var loader: ImageLoadingViewModel
    init(url: String,key: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    var body: some View {
        ZStack {
            if loader.isLoading{
                ProgressView()
            }else if let image = loader.image{
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DownloadingImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
        .frame(width: 75,height: 75)
}
