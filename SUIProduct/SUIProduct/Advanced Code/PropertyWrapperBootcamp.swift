//
//  PropertyWrapperBootcamp.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/29.
//

import SwiftUI
extension FileManager{
    
    static func documentsPath(key: String) -> URL{
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appending(path: "\(key).txt")
    }
}
@propertyWrapper
struct FileManageProperty: DynamicProperty{
    @State private var title: String
    let key: String
    var wrappedValue:String {
        get{
            title
        }
        nonmutating set{
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<String>{
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }

    }
    
    init(wrappedValue: String, _ key: String) {
        self.key = key
        do {
            title = try String(contentsOf: FileManager.documentsPath(key: key), encoding: .utf8)
            print("SUCCESS READ")
        } catch{
            title = wrappedValue
            print("ERROR READ\(error)")
        }
    }
    func save(newValue: String){
        do {
            try newValue.write(to: FileManager.documentsPath(key: key), atomically: false, encoding: .utf8)
            title = newValue
            print(NSHomeDirectory())
            print("SUCCESS SAVED")
        } catch  {
            print("ERROR SAVING: \(error)")
        }
    }
}

struct PropertyWrapperBootcamp: View {
    @FileManageProperty("custom_title_1") private var title: String = "Start Text"
    @FileManageProperty("custom_title_2") private var title2: String = "Start Text2"
    @FileManageProperty("custom_title_3") private var title3: String = "Start Text3"
    
    @State private var subtitle: String = "SUBTITLE"
    var body: some View {
        VStack(spacing: 40.0) {
            Text(title)
                .font(.largeTitle)
            Text(title2)
                .font(.largeTitle)
            Text(title3)
                .font(.largeTitle)
            PropertyWrapperChildView(subtitle: $title)
            
            Button("Click me 1") {
                title = "title1"
            }
            Button("Click me 2") {
                title = "title2"
                title2 = "SOME RANDOM TITLE"
            }
        }
    }
}

struct PropertyWrapperChildView: View {
    
    @Binding var subtitle: String
    var body: some View {
        Button {
            subtitle = "ANOTHER TITLE!!!!!!"
        } label: {
            Text(subtitle)
                .font(.largeTitle)
        }
    }
}

#Preview {
    PropertyWrapperBootcamp()
}
