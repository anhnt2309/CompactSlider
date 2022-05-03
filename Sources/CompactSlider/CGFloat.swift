// The MIT License (MIT)
//
// Copyright (c) 2022 Alexey Bukhtin (github.com/buh).
//

import SwiftUI

extension CGFloat {
    
    static let labelPadding: CGFloat = {
        #if os(macOS)
        6
        #else
        12
        #endif
    }()
    
    static let cornerRadius: CGFloat = {
        #if os(macOS)
        4
        #else
        8
        #endif
    }()
    
    static let scaleMin: CGFloat = {
        #if os(macOS)
        3
        #else
        6
        #endif
    }()
    
    static let scaleMax: CGFloat = {
        #if os(macOS)
        5
        #else
        10
        #endif
    }()
}