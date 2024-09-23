//
//  ControlGroupPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/12.
//

import SwiftUI
//嵌套
struct ControlGroupPracticeView: View {
    var body: some View {
        Menu("My menu") {
            ControlGroup("One") {
                Button("One") {
                    
                }
                Button("Two") {
                    
                }
                Menu("How are you") {
                    Button("good") {
                        
                    }
                    Button("bad") {
                        
                    }
                }
            }
            Button("Two") {
                
            }
            Menu("Three") {
                Button("Hi") {
                    
                }
                Button("Hello") {
                    
                }
                Menu("How are you") {
                    Button("good") {
                        
                    }
                    Button("bad") {
                        
                    }
                }
            }

        }
    }
}

#Preview {
    ControlGroupPracticeView()
}
