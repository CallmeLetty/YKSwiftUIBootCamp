//
//  BMCPageControl.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/8/31.
//

import SwiftUI

struct BMCQuizIntroView: View {
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    ZStack {
      Image.BMC("quiz_bg_img")?
        .resizable(resizingMode: .stretch)
        .scaledToFill()
        .scaleEffect(Frame.scale)
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        HStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image.BMC("nav_darkback_icon")
          }
          .padding(.leading, 20)
          .padding(.top, 36)
          Spacer()
        }
        Spacer()
        
        Image.BMC("quiz_intro_icon")
        
        Text("The Adult ADHD Self-Report Scale (ASRS-v1.1) Symptom Checklist was developed in conjunction with the World Health Organization (WHO).")
          .bold()
          .padding(.horizontal, 20)
          .foregroundColor(Color(hex: 0xDDE7FF))
          .font(.title3)
          .lineSpacing(4)
          .padding(.bottom, 15)
          
        Text("It takes about 5 minutes to complete.")
          .padding(.horizontal, 25)
          .frame(width: Frame.SCREEN_WIDTH,alignment: .leading)
          .foregroundColor(Color(hex: 0xDDE7FF).opacity(0.6))
          .font(.subheadline)
        
        Spacer()
        
        Button {

        } label: {
            Text("Continue")
                .foregroundColor(Color.black)
                .font(.headline)
        }
        .frame(width: 335,height: 58)
        .background(Color(hex: 0x83D6FF))
        .cornerRadius(29)
        .padding(.bottom, 44)
      }
    }
  }
}

struct BMCQuizSingleOptionView: View {
  @Environment(\.presentationMode) var presentationMode
  var index: Int
  var whole: Int
  var title: String
  var options: [String]
  
  var body: some View {
    ZStack {
      Image.BMC("quiz_bg_img")?
        .resizable(resizingMode: .stretch)
        .scaledToFill()
        .scaleEffect(Frame.scale)
        .edgesIgnoringSafeArea(.all)
      
      VStack(alignment: .leading) {
        HStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image.BMC("nav_darkback_icon")
          }
          .padding(.leading, 20)
          .padding(.top, 36)
          .padding(.bottom, 24)
          Spacer()
        }
        
        ScrollView {
          VStack(alignment: .leading) {
              Text("Question \(index) of \(whole)")
                .padding(.horizontal, 25)
                .foregroundColor(Color(hex: 0xDDE7FF).opacity(0.6))
                .font(.subheadline)
                .padding(.bottom, 16)
              
              Text(title)
                .bold()
                .padding(.horizontal, 20)
                .foregroundColor(Color(hex: 0xDDE7FF))
                .font(.title3)
                .lineSpacing(4)
                .padding(.bottom, 36)
              
              VStack(alignment: .leading) {
                ForEach(0..<options.count,id:\.self) { index in
                  HStack {
                    Text(index.indexToString())
                      .frame(width: 30, height: 30, alignment: .center)
                      .padding(.horizontal, 12)
                      .foregroundColor(Color(hex: 0x253756))
                      .font(.system(size: 16))
                      .lineSpacing(4)
                      .background(Circle().fill(Color(hex: 0xDDE7FF)))
                      .padding(.vertical, 15)
                    
                    Text(options[index])
                      .foregroundColor(Color(hex: 0xDDE7FF))
                      .font(.system(size: 16))
                      .lineSpacing(4)
                      .padding(.vertical, 15)
                      .padding(.trailing, 12)
                    
                    Spacer()
                  }
                  .frame(width: Frame.SCREEN_WIDTH - 20 * 2,height: 49)
                  .background(RoundedRectangle(cornerRadius: 25).fill(Color(hex: 0x1E3564)))
                  .padding(.leading, 20)
                  .padding(.bottom, 20)
                }
              }
            
          }
        }
        
        Spacer()
      }
      
    }
  }
}

extension Int {
  func indexToString() -> String {
    switch self {
    case 0: return "A"
    case 1: return "B"
    case 2: return "C"
    case 3: return "D"
    case 4: return "E"
    case 5: return "F"
    default:return "Unknown"
    }
  }
}

struct BMCQuizIntroView_Previews: PreviewProvider {
  static var previews: some View {
    BMCQuizSingleOptionView(index: 1, whole: 12, title: "How often do you have trouble wrapping up the final details of a project, once the challenging parts have been done?", options: ["Never","Rarely","Sometimes","Often","Often"])
    }
}
