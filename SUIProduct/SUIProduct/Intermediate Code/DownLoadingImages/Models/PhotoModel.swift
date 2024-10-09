//
//  PhotoModel.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/29.
//

import Foundation
/*
 "albumId": 1,
 "id": 1,
 "title": "accusamus beatae ad facilis cum similique qui sunt",
 "url": "https://via.placeholder.com/600/92c952",
 "thumbnailUrl": "https://via.placeholder.com/150/92c952"
 */
struct PhotoModel: Identifiable, Codable{
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
}
