//
//  BMCMeNotificationView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/8/10.
//

import SwiftUI

@available(iOS 15.0, *)
struct BMCMeNotificationView: View {
    // EnvironmentValues
    @Environment(\.dismiss) var dismiss
    @State private var selectedDate = Date()
    @State var continueEnable: Bool = true
    
    let weekText = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    
    var body: some View {
        ZStack {
          Color(hex: 0x213358)
          .edgesIgnoringSafeArea(.all)
          
          Image("nav_back1_icon")
            .padding(.leading, 20)
          
            VStack {
                Text("Notification Settings")
                    .font(Font(CTFont(.label, size: 18)))
                    .foregroundColor(.white)
                    .bold()
                    .frame(alignment: .center)
                    .padding(.top, 5)
                    .padding(.bottom, 40.5)
                
                HStack {
                    ForEach(0..<weekText.count, id: \.self) { index in
                        Text(weekText[index])
                            .font(Font(CTFont(.label, size: 12)))
                            .foregroundColor(Color(hex: 0xDDE7FF))

                            .padding(.horizontal,8)
                            .padding(.vertical,11)
                            .background(Color(hex: 0xDDE7FF).opacity(0.1))
                            .cornerRadius(20)
                    }
                }
                Text("Set your exercise time")
                    .padding(.top, 27)
                    .padding(.bottom, 42)
                
                DatePicker(selection: $selectedDate, displayedComponents: [.hourAndMinute]){}
                    .labelsHidden()
                    .preferredColorScheme(.dark)
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding(.horizontal, 20)
                    .scaleEffect(x: 1.2, y: 1.2, anchor: .center)
                Spacer()
                Text("You must select both the day and the time you want to exercise. Perseverance and regularity can help you achieve stunning results.")
                    .padding(.horizontal, 47.5)
                    .foregroundColor(Color(hex: 0xDDE7FF).opacity(0.5))
                    .multilineTextAlignment(.center)
                
                Button {
                    print("Save")
                } label: {
                    Text("Save")
                        .frame(width: 335, height: 58)
                        .foregroundColor(Color(hex: 0x131C41))
                        .background(continueEnable ? Color(hex: 0x83D6FF) : Color.gray)
                        .cornerRadius(29)
                }
                .padding(.top, 30)
                .padding(.bottom, 20)

            }
        }
    }
}

struct BMCMeNotificationView_Previews: PreviewProvider {
    static var previews: some View {
      if #available(iOS 15.0, *) {
        BMCMeNotificationView()
      } else {
        // Fallback on earlier versions
      }
    }
}
