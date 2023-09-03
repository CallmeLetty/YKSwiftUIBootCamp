//
//  BMCExtensions.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/8/25.
//

import Foundation
import UIKit
import SwiftUI

struct Frame {
    static let SCREEN_WIDTH = UIScreen.main.bounds.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.height
    
    static let scale = SCREEN_HEIGHT / 667
}

struct BMCColor {
  static let title = Color(hex:0xDDE7FF)
  static let normalBg = Color(hex:0x161C44)
  static let cardBg = Color(hex:0x213358)
}
