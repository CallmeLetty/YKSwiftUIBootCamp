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
  
  @ViewBuilder
  func addCircularBackground(isFilled: Bool,
                             isSelected: Bool,
                             highlightColor: Color = Color(hex: 0xFFCCCC),
                             normalColor: Color = Color(hex: 0xCCCCCC),
                             padding: CGFloat = 9) -> some View {
    self
      .padding(padding)
      .foregroundColor(Color(hex: 0x9933FF))
      .background(
        Circle()
          .foregroundColor(isSelected ? highlightColor : normalColor)
          .frame(width: 35, height: 35)
          .opacity(isFilled ? 1.0 : 0.5)
          .padding(isSelected ? 3 : 0)
          .overlay(
            Circle()
              .stroke(highlightColor, lineWidth: isSelected ? 2 : 0)
          )
      )
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


extension Calendar {
  func generateDates(inside interval: DateInterval,
                     matching components: DateComponents) -> [Date] {
    var dates = [interval.start]
    enumerateDates(startingAfter: interval.start,
                   matching: components,
                   matchingPolicy: .nextTime) { date, _, stop in
      guard let date = date else {
        return
      }
      if date < interval.end {
        dates.append(date)
      } else {
        stop = true
      }
    }
    return dates
  }
}

extension Date {
    
    func getDayNumber()->Int {
        return Calendar.current.component(.day, from: self)
    }
    
    func getMonthString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM"
        return formatter.string(from: self)
    }
    
    func getDaysForMonth() -> [Date] {
        guard
            let monthInterval = Calendar.current.dateInterval(of: .month, for: self),
            let monthFirstWeek = Calendar.current.dateInterval(of: .weekOfMonth, for: monthInterval.start),
            let monthLastWeek = Calendar.current.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else {
            return []
        }
        let resultDates = Calendar.current.generateDates(inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
                                                         matching: DateComponents(hour: 0, minute: 0, second: 0))
        return resultDates
    }
    
    func isSameDay(comparingTo: Date) -> Bool {
        let selfComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let comparingComponents = Calendar.current.dateComponents([.year, .month, .day], from: comparingTo)
        guard let selfYear = selfComponents.year,
              let selfMonth = selfComponents.month,
              let selfDay = selfComponents.day,
              let comparingYear = comparingComponents.year,
              let comparingMonth = comparingComponents.month,
              let comparingDay = comparingComponents.day else {
            return false
        }
        return selfYear == comparingYear &&
               selfMonth == comparingMonth &&
               selfDay == comparingDay
    }
    
    func getLastMonth() -> Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self) ?? self
    }
    
    func getNextMonth() -> Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: self) ?? self
    }
    
}
