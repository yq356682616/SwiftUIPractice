//
//  UnitTestingPracticeView.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/18.
//

import SwiftUI

struct UnitTestingPracticeView: View {
    
    @StateObject private var vm: UnitTestingBootcampViewModel
    
    init(isPremium: Bool) {
        self._vm = StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
    }
    var body: some View {
        Text(vm.isPremium.description)
    }
}

#Preview {
    UnitTestingPracticeView(isPremium: true)
}
