//
//  BMCExtensions.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/8/16.
//

import SwiftUI

public extension Color {
    init(hex: Int) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


extension UIColor {
  
  public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
    var formatted = hexString.replacingOccurrences(of: "0x", with: "")
    formatted = formatted.replacingOccurrences(of: "#", with: "")
    if let hex = Int(formatted, radix: 16) {
      let red = CGFloat(CGFloat((hex & 0xFF0000) >> 16)/255.0)
      let green = CGFloat(CGFloat((hex & 0x00FF00) >> 8)/255.0)
      let blue = CGFloat(CGFloat((hex & 0x0000FF) >> 0)/255.0)
      self.init(red: red, green: green, blue: blue, alpha: alpha)
    } else {
      return nil
    }
  }
}

public extension Image {
  static func BMC(_ name: String) -> Image? {
    return Image(name, bundle: BMCBundle.bundle())
  }
}
