//
//  ArraysPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/19.
//

import SwiftUI

struct UserModel1: Identifiable{
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

@Observable class ArrayModificationViewModel{
    var dataArray: [UserModel1] = []
    var filteredArray: [UserModel1] = []
    var mapedArray: [String] = []
    init() {
        getUsers()
        updateFilteredArray()
    }
    func updateFilteredArray(){
        //sored
        /*
//        filteredArray = dataArray.sorted { (user1, user2)-> Bool in
//            return user1.points > user2.points
//        }
//        filteredArray = dataArray.sorted(by: {$0.points > $1.points})
        */
        //filter
        /*
//        filteredArray = dataArray.filter({ user -> Bool in
//            return user.isVerified
////            return user.name.contains("i")
////            return user.points < 50
//        })
        filteredArray = dataArray.filter({$0.isVerified})
         */
        //map
        /*
//        mapedArray = dataArray.map({ user -> String in
//            return user.name ?? "ERROR"
//        })
//        mapedArray = dataArray.map({ $0.name })
        //去空
//        mapedArray = dataArray.compactMap({ user -> String? in
//            return user.name
//        })
//        mapedArray = dataArray.compactMap({ $0.name })
         */
        let sort = dataArray.sorted(by: { $0.points > $1.points })
        let filter = dataArray.filter({ $0.isVerified })
        let map = dataArray.compactMap({ $0.name })
        
        mapedArray = dataArray.sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
    }
    func getUsers(){
        let user1 = UserModel1(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel1(name: "Chris", points: 0, isVerified: false)
        let user3 = UserModel1(name: nil, points: 20, isVerified: true)
        let user4 = UserModel1(name: "Emily", points: 50, isVerified: false)
        let user5 = UserModel1(name: "Samantha", points: 45, isVerified: true)
        let user6 = UserModel1(name: "Jason", points: 23, isVerified: false)
        let user7 = UserModel1(name: "Sarah", points: 76, isVerified: true)
        let user8 = UserModel1(name: nil, points: 45, isVerified: false)
        let user9 = UserModel1(name: "Steve", points: 1, isVerified: true)
        let user10 = UserModel1(name: "Amanda", points: 100, isVerified: false)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
        
    }
}
struct ArraysPracticeView: View {
    @State var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20, content: {
                ForEach(vm.mapedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
                
                
                
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading,content: {
//                        Text(user.name)
//                        HStack(content: {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified{
//                                Image(systemName: "flame.fill")
//                            }
//                        })
//                    })
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(
//                        Color.blue
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                    )
//                    .padding(.horizontal)
//                }
            })
        }
    }
}

#Preview {
    ArraysPracticeView()
}
