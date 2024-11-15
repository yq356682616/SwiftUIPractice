//
//  CustomNavBarPreferenceKeys.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/16.
//

import Foundation
import SwiftUI

struct CustomNavBarTitlePreferenceKey: PreferenceKey{
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarSubTitlePreferenceKey: PreferenceKey{
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}
struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey{
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View{
    func customNavigationTitle(_ title: String) -> some View{
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    func customNavigationSubtitle(_ subtitle: String?) -> some View{
        preference(key: CustomNavBarSubTitlePreferenceKey.self, value: subtitle)
    }
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View{
        preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNavBarItems(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false) -> some View{
        self.customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBarBackButtonHidden(backButtonHidden)
    }
}
