//
//  Location.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/11/5.
//

import Foundation
import MapKit
struct Location: Identifiable, Equatable{
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    //Identifiable
    var id: String{
        name + cityName
    }
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
