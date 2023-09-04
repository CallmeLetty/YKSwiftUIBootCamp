//
//  BMCMeReminderDetailView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/9/1.
//

import SwiftUI
import UIKit

public enum BMCMeReminderRepeatType: Int, CaseIterable {
  case never = 0,daily,everyMonday,everyTuesday,everyWednesday,
  everyThursday,everyFriday,everySaturday,everySunday,weeksdays,
  weekends
  
  var desc: String {
    switch self {
    case .never:
      return "Never"
    case .daily:
      return "Daily"
    case .everyMonday:
      return "Every Monday"
    case .everyTuesday:
      return "Every Tuesday"
    case .everyWednesday:
      return "Every Wednesday"
    case .everyThursday:
      return "Every Thursday"
    case .everyFriday:
      return "Every Friday"
    case .everySaturday:
      return "Every Saturday"
    case .everySunday:
      return "Every Sunday"
    case .weeksdays:
      return "Weekdays"
    case .weekends:
      return "Weekends"
    }
  }
}

public struct BMCMeReminderDetailView: View {
  
  @State public var title: String
  @State public var detail: String
  @State public var date: Date
  @State public var repeatType: BMCMeReminderRepeatType
  
  public init(title: String, detail: String, date: Date, repeatType: BMCMeReminderRepeatType) {
    _title = State(initialValue: title)
    _detail = State(initialValue: detail)
    _date = State(initialValue: date)
    _repeatType = State(initialValue: repeatType)
  }
  
  @State private var showTitleList = false
  @State private var showTypeList = false
  
  private let titleList = ["Go for a walk","Stretches","Grab something to drink","Mindful eating"]
  
  private let hPadding: CGFloat = 16
  
  public var body: some View {
        ZStack(alignment: .top) {
          ScrollView(.vertical) {
            VStack {
                HStack {
                  TextField("inputPlaceHolder", text: $title)
                    .foregroundColor(BMCColor.title)
                    .font(.system(size: 17))
                    .padding(.leading, 12 + hPadding)
                    .padding(.trailing, 12)
                    .textFieldStyle(.plain)
                    .background(Color.clear)
                  Spacer()
                  Button {
                    showTitleList.toggle()
                  } label: {
                    Image.BMC("fold_down")
                  }
                  .padding(.trailing, 12 + hPadding)

                }.frame(height: 52)
              
              Path{ path in
                path.move(to: CGPoint(x:Frame.SCREEN_WIDTH - (hPadding+11) * 2, y:0))
                path.addLine(to: CGPoint(x:11, y:0))
              }
              .stroke(Color.white.opacity(0.1), lineWidth:0.5)

              TextEditor(text: $detail)
                .background(BMCColor.cardBg)
                .foregroundColor(BMCColor.title)
                .frame(height:130)
                .font(.system(size: 17))
                .padding(.horizontal, 12)
                .multilineTextAlignment(.leading)
              }
              .padding(.horizontal,hPadding)
              .background(
                RoundedRectangle(cornerRadius: 12)
                  .fill(BMCColor.cardBg)
                  .frame(width: Frame.SCREEN_WIDTH - hPadding * 2)
                  .cornerRadius(12)
            )
            
            VStack(spacing: 0) {
              HStack {
                Text("Set Reminder")
                  .foregroundColor(BMCColor.title)
                  .font(.system(size: 14))
                  .padding(.leading, hPadding)
                  .padding(.trailing, 12)
                
                DatePicker(selection: $date) {
                  Text("1")
                }
                .colorScheme(.dark)
                .labelsHidden()
                .padding(.trailing, 12)
                
              }.frame(height: 52)
              
              Path{ path in
                path.move(to: CGPoint(x:Frame.SCREEN_WIDTH - (hPadding+11) * 2, y:0))
                path.addLine(to: CGPoint(x:11, y:0))
              }
              .stroke(Color.white.opacity(0.1), lineWidth:0.5)
              
              HStack {
                Text("Repeat")
                  .foregroundColor(BMCColor.title)
                  .font(.system(size: 16))
                  .padding(.leading, hPadding)
                  .padding(.trailing, 12)
                
                Spacer()
                
                Text(repeatType.desc)
                  .foregroundColor(BMCColor.title)
                  .font(.system(size: 16))
                  .padding(.leading, hPadding)
                  .padding(.trailing, 12)

                NavigationLink(destination: BMCReminderDetailRepeatView(repeatType: $repeatType)) {
                  Text(">")
                    .foregroundColor(BMCColor.title)
                    .font(.system(size: 20))
                    .padding(.trailing, 20)
                }
              }
              .frame(height: 54)
            }
            .padding(.horizontal,hPadding)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(BMCColor.cardBg)
                .frame(width: Frame.SCREEN_WIDTH - hPadding * 2)
                .cornerRadius(12)
              )
          }
          
          if showTitleList {
            VStack {
              ForEach(titleList, id:\.self) { str in
                Text(str)
                  .foregroundColor(BMCColor.title)
                  .frame(width: Frame.SCREEN_WIDTH - hPadding * 2,height: 50)
                  .background(Color(hex: 0x213358))
                  .cornerRadius(12)
              }
              
            }
            .background(Color(hex: 0x213358))
            .cornerRadius(12)
            .offset(y: 52)
          }
        }
        .background(BMCColor.normalBg)
      
    }
}

struct BMCReminderDetailRepeatView: View {
  
  @Binding var repeatType: BMCMeReminderRepeatType
  
  @Environment(\.presentationMode) var presentationMode
  
  private let repeatList = BMCMeReminderRepeatType.allCases.map{return $0.desc}
  
  var body: some View {
    ZStack {
      BMCColor.normalBg.edgesIgnoringSafeArea(.all)
      VStack(spacing: 0) {
        List(0..<repeatList.count,id:\.self) { index in

          Text(repeatList[index])
            .foregroundColor(BMCColor.title)
            .frame(width: Frame.SCREEN_WIDTH - 12 * 2,height: 50)
            .cornerRadius(12)
            .listRowBackground(BMCColor.cardBg)
            .onTapGesture {
              repeatType = BMCMeReminderRepeatType(rawValue: index) ?? .never
              
              presentationMode.wrappedValue.dismiss()
            }
        }
        .listRowBackground(Color.clear)
        .background(Color.clear)
        .frame(width: Frame.SCREEN_WIDTH - 12 * 2,height: CGFloat(repeatList.count + 5) * 50)
        .cornerRadius(12)
      .listStyle(.plain)
        
        Spacer()
      }
      .padding(.top, 21)
//      VStack(spacing: 0) {
//        ForEach(repeatList, id:\.self) { str in
//          Text(str)
//            .foregroundColor(BMCColor.title)
//            .frame(width: Frame.SCREEN_WIDTH - 12 * 2,height: 50)
//            .cornerRadius(12)
//            .background(BMCColor.cardBg)
//
//          Path { path in
//            path.move(to: CGPoint(x:Frame.SCREEN_WIDTH - (12+11) * 2, y:0))
//            path.addLine(to: CGPoint(x:11, y:0))
//          }.stroke(Color.white.opacity(0.2), lineWidth:0.5)
//        }
//      }
//      .frame(width: Frame.SCREEN_WIDTH - 12 * 2,height: CGFloat(repeatList.count) * 50)
//      .cornerRadius(12)
//      .edgesIgnoringSafeArea(.all)
    }
//    .edgesIgnoringSafeArea(.all)
  }
}

struct BMCMeReminderDetailView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        BMCMeReminderDetailView(title: "",
                                detail: "",
                                date: Date(),
                                repeatType: .never)
      }
    }
}

extension UITextView {
    open override var frame: CGRect {
        didSet {
            backgroundColor = .clear //<<here clear
        }

    }
}
