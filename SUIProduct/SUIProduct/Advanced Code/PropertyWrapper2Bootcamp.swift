//
//  PropertyWrapper2Bootcamp.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/31.
//

import SwiftUI

@propertyWrapper
struct Capitalized: DynamicProperty{
    
    @State private var value: String
    
    var wrappedValue: String{
        get{
            value
        }
        nonmutating set{
            value = newValue.capitalized
        }
    }
    init(wrappedValue: String) {
        self.value = wrappedValue.capitalized
    }
    
    
}

@propertyWrapper
struct Uppercased: DynamicProperty{
    
    @State private var value: String
    
    var wrappedValue: String{
        get{
            value
        }
        nonmutating set{
            value = newValue.uppercased()
        }
    }
    init(wrappedValue: String) {
        self.value = wrappedValue.uppercased()
    }
    
    
}

@propertyWrapper
struct FileManageCodableProperty<T: Codable>: DynamicProperty{
    @State private var value: T?
    let key: String
    var wrappedValue:T? {
        get{
            value
        }
        nonmutating set{
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<T?>{
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )

    }
    
    init(_ key: String) {
        self.key = key
        do {
            let url = FileManager.documentsPath(key: key)
            let data = try Data(contentsOf: url)
            let object = try JSONDecoder().decode(T.self, from: data)
            _value = State(wrappedValue: object)
            print("SUCCESS READ")
        } catch{
            _value = State(wrappedValue: nil)
            print("ERROR READ\(error)")
        }
    }
    
    init(_ key: KeyPath<FileManagerValue, FileManagerKeypath<T>>) {
        let keypath = FileManagerValue.shared[keyPath: key]
        let key = keypath.key
        self.key = key
        do {
            let url = FileManager.documentsPath(key: key)
            let data = try Data(contentsOf: url)
            let object = try JSONDecoder().decode(T.self, from: data)
            _value = State(wrappedValue: object)
            print("SUCCESS READ")
        } catch{
            _value = State(wrappedValue: nil)
            print("ERROR READ\(error)")
        }
    }
    func save(newValue: T?){
        do {
            let data = try JSONEncoder().encode(newValue)
            try data.write(to: FileManager.documentsPath(key: key))
            value = newValue
            print(NSHomeDirectory())
            print("SUCCESS SAVED")
        } catch  {
            print("ERROR SAVING: \(error)")
        }
    }
}
struct User: Codable{
    let name: String
    let age: Int
    let isPremium: Bool
}

struct FileManagerValue{
    static let shared = FileManagerValue()
    private init() {}
    let userProfile = FileManagerKeypath(key: "user_profile", type: User.self)
}

enum FileManagerKeys: String{
    case userProfile
}

struct FileManagerKeypath<T:Codable>{
    let key: String
    let type: T.Type
}

import Combine


@propertyWrapper
struct FileManageCodableStreamableProperty<T: Codable>: DynamicProperty{
    @State private var value: T?
    let key: String
    private let publisher: CurrentValueSubject<T?, Never>
    
    var wrappedValue:T? {
        get{
            value
        }
        nonmutating set{
            save(newValue: newValue)
        }
    }
    var projectedValue: CustomProjectValue<T>{
        CustomProjectValue(
            binding:
                Binding(
                get: { wrappedValue },
                set: { wrappedValue = $0 }
            ),
            publisher: publisher
        )
    }
    
//    var projectedValue: CurrentValueSubject<T?, Never>{
//        publisher
//    }
//    var projectedValue: Binding<T?>{
//        Binding(
//            get: { wrappedValue },
//            set: { wrappedValue = $0 }
//        )
//    }
    
    init(_ key: String) {
        self.key = key
        do {
            let url = FileManager.documentsPath(key: key)
            let data = try Data(contentsOf: url)
            let object = try JSONDecoder().decode(T.self, from: data)
            _value = State(wrappedValue: object)
            publisher = CurrentValueSubject(object)
            print("SUCCESS READ")
        } catch{
            _value = State(wrappedValue: nil)
            publisher = CurrentValueSubject(nil)
            print("ERROR READ\(error)")
        }
    }
    
    init(_ key: KeyPath<FileManagerValue, FileManagerKeypath<T>>) {
        let keypath = FileManagerValue.shared[keyPath: key]
        let key = keypath.key
        self.key = key
        do {
            let url = FileManager.documentsPath(key: key)
            let data = try Data(contentsOf: url)
            let object = try JSONDecoder().decode(T.self, from: data)
            _value = State(wrappedValue: object)
            publisher = CurrentValueSubject(object)
            print("SUCCESS READ")
        } catch{
            _value = State(wrappedValue: nil)
            publisher = CurrentValueSubject(nil)
            print("ERROR READ\(error)")
        }
    }
    func save(newValue: T?){
        do {
            let data = try JSONEncoder().encode(newValue)
            try data.write(to: FileManager.documentsPath(key: key))
            value = newValue
            publisher.send(newValue)
            print(NSHomeDirectory())
            print("SUCCESS SAVED")
        } catch  {
            print("ERROR SAVING: \(error)")
        }
    }
}

struct CustomProjectValue<T:Codable>{
    let binding: Binding<T?>
    let publisher: CurrentValueSubject<T?, Never>
    
    var stream: AsyncPublisher<CurrentValueSubject<T?, Never>>{
        publisher.values
    }
}

struct PropertyWrapper2Bootcamp: View {
    
//    @Capitalized private var title: String = "Hello,world!"
    @Uppercased private var title: String = "Hello,world!"
//    @FileManageCodableProperty(FileManagerKeys.userProfile.rawValue) private var userProfile: User?
//    @FileManageCodableProperty(\.userProfile) private var userProfile: User?
//    @FileManageCodableProperty(\.userProfile) private var userProfile
    @FileManageCodableStreamableProperty(\.userProfile) private var userProfile
    var body: some View {
        VStack(spacing: 40.0) {
            Button(title) {
                title = "new title"
            }
            SomeBindngView(userProfile: $userProfile.binding)
            
            Button(userProfile?.name ?? "no value") {
                userProfile = User(name: "Ricky", age: 55, isPremium: true)
            }
        }
        .onReceive($userProfile.publisher, perform: { newValue in
            print("RECIEVED NEW VALUE OF: \(newValue)")
        })
        .task {
            for await newValue in $userProfile.stream {
                print("STREAM NEW OF: \(newValue)")
            }
        }
        .onAppear {
            print(NSHomeDirectory())
        }
    }
}

struct SomeBindngView: View {
    
    @Binding var userProfile: User?
    var body: some View {
        Button(userProfile?.name ?? "no value") {
            userProfile = User(name: "EMILY", age: 1010, isPremium: false)
        }
    }
}

#Preview {
    PropertyWrapper2Bootcamp()
}
