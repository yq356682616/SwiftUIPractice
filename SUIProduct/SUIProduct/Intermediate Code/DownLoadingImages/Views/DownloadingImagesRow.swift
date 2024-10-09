//
//  DownloadingImagesRow.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/29.
//

import SwiftUI
import CachedAsyncImage
struct DownloadingImagesRow: View {
    let model : PhotoModel
    var body: some View {
        HStack {
//            DownloadingImageView(url: model.url, key: "\(model.id)")
//                .frame(width: 75,height: 75)
            CachedAsyncImage(url: URL(string: model.url),content: { phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .clipShape(Circle())
                }else if phase.error != nil{
                    Color.white
                }else{
                    ProgressView()
                }
            })
            .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundStyle(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DownloadingImagesRow(model: PhotoModel(albumId: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
        .padding()
}
