//
//  CodablePracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/20.
//

import SwiftUI


//codable = Decodable + Encodable
struct CustomerModel: Identifiable,Codable{
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
//系统自动 codable
//    enum CodingKeys: String, CodingKey{
//        case id
//        case name
//        case point
//        case isPremium
//    }
//    
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .point)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .point)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
}

class CodeableViewModel:ObservableObject{
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    func getData(){
        guard let data = getJsonData()else{return}
        
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
        
//        do{
//            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        }catch let error{
//            print("Error decoding.\(error)")
//        }
        
        
        
//        self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//            let dictionary = localData as? [String : Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let poins = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool
//        {
//            
//            let newCustomer = CustomerModel(id: id, name: name, points: poins, isPremium: isPremium)
//            customer = newCustomer
//        }
    }
    func getJsonData() -> Data?{
        let customer = CustomerModel(id: "111", name: "Emily", points: 100, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
//        let dictionary: [String: Any] = [
//            "id" : "12345",
//            "name" : "Joe",
//            "points" : 5,
//            "isPremium" : true
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        return jsonData
    }
}
struct CodablePracticeView: View {
    
    @StateObject var vm = CodeableViewModel()
    
    var body: some View {
        VStack(spacing: 20.0) {
            if let customer = vm.customer{
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodablePracticeView()
}
