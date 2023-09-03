//
//  BMCMeChangePasswordView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/8/19.
//

import SwiftUI

extension View {
    func registerKeyboard() -> some View {
        NotificationCenter.default
            .addObserver(forName: UIResponder.keyboardWillHideNotification,
                         object: self,
                         queue: .main) { noti in
                print(noti.description)
            }
        return self
    }
}

struct BMCMeChangePasswordView: View {
    private var continueEnable: Bool {
        get {
            return judgeButtonState()
        }
    }
    
    @State var originPassword: String = "" {
        didSet {
            print("originPassword: \(originPassword)")
        }
    }
    @State var newPassword: String = ""
    @State var repestPassword: String = ""
    
    var body: some View {
        ZStack {
            Color(hex: 0x161C44)
                .edgesIgnoringSafeArea(.all)
            Image("nav_back1_icon")
                .padding(.leading, 20)
            VStack {
                Text("Change Password")
                    .font(Font(CTFont(.label, size: 18)))
                    .foregroundColor(.white)
                    .bold()
                    .frame(alignment: .center)
                    .padding(.bottom, 40.5)
                
                let list = [
                    ("Current Password", $originPassword),
                    ("New Password", $newPassword),
                    ("Repeat Password", $repestPassword)
                ]
                
                ForEach(0..<list.count,id: \.self) { index in
                    BMCSecureField(text: list[index].1,
                                   placeholder: list[index].0)
                        .padding(.vertical, 7.5)
                }

                Text("Password should contain 8-18 characters and should at least include two types from letter, number and symbol.")
                    .padding(.horizontal, 20)
                    .foregroundColor(BMCColor.title.opacity(0.5))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
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
    
    
    private func judgeButtonState() -> Bool {
        if originPassword.count > 0,
           newPassword.count > 0,
           repestPassword.count > 0,
           newPassword == repestPassword {
            return true
        } else {
            return false
        }
    }
}

struct BMCSecureField: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(BMCColor.title.opacity(0.5))
                    .padding(.horizontal, 4)
                    .padding(.horizontal, 20)
            }
            SecureField(placeholder, text: $text)
            .frame(height: 60)
            .foregroundColor(BMCColor.title)
            .padding(.horizontal, 20)
            
                
        }
        .frame(height: 60) // Adjust the height here
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: 0x213358), lineWidth: 1)
                .background(Color(hex: 0x213358))
                .cornerRadius(10)
                .padding(.horizontal, 20)
        )
    }
}

struct BMCMeChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        BMCMeChangePasswordView()
            
    }
}
