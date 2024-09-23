//
//  ContentUnavailableViewPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/9/12.
//

import SwiftUI

struct ContentUnavailableViewPracticeView: View {
    var body: some View {
        ContentUnavailableView("No InterNet Connection", systemImage: "wifi.slash", description: Text("Please conncet to the internet and try again."))
        ContentUnavailableView.search(text: "abc")
        //做缺省页
    }
}

#Preview {
    ContentUnavailableViewPracticeView()
}
