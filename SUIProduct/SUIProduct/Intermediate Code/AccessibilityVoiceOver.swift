//
//  AccessibilityVoiceOver.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/8.
//

import SwiftUI

struct AccessibilityVoiceOver: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Value", isOn: $isActive)
                    HStack {
                        Text("Values")
                        Spacer()
                        Text(isActive ? "On" : "Off")
                            .accessibilityHidden(true)
                    }
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityValue(isActive ? "is On" : "is Off")
                    .accessibilityHint("Double tap to toggle setting.")
                } header: {
                    Text("PREFERENCE")
                }
                
                Section {
                    Button("Favorites"){
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    Text("Favorites")
                        .onTapGesture {
                            
                        }
                    
                } header: {
                    Text("APPLICATION")
                }
                
                VStack {
                    Text("CONTENT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    ScrollView(.horizontal) {
                        HStack(spacing: 8.0) {
                            ForEach(0..<10) { x in
                                VStack {
                                    Image("pic")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100,height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    Text("item \(x)")
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                }
            }
            .navigationTitle("Setting")
        }
    }
}

#Preview {
    AccessibilityVoiceOver()
}
