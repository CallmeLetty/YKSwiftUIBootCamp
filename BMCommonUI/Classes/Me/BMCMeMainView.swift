//
//  BMCMeMainView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/8/10.
//

import SwiftUI

struct BMCMeMainView: View {
    
    @State var data = ["Reminders",
                       "UID: 602449045",
                       "Change Passward",
                       "Support & Help",
                       "About"]
    
    var body: some View {
        ZStack {
            Color(hex:0x161C44)
            .edgesIgnoringSafeArea(.all)
            VStack {
                // Base info
                HStack(spacing: 12) {
                    Image(uiImage: UIImage(named: "me_about_logo", in: BMCBundle.bundle(), with: nil)!)
                        .resizable()
                        .frame(width: 75,height: 75)
                        .border(.white, width: 1)
                        .cornerRadius(37.5)
                        .padding(.leading,16)
                    Text("Test Name")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                    Spacer()
                    Button("Link") {
                        print("link")
                    }
                    .foregroundColor(Color(hex: 0x253756))
                    .frame(width: 103, height: 39, alignment: .center)
                    .background(Color(hex: 0x83D6FF))
                    .cornerRadius(20)
                    .padding(.trailing,20)
                }
                .padding(.bottom, 40)
                
                // List
                ForEach(0..<data.count, id: \.self) { index in
                    let text = data[index]
                    BMCMeMainCell(title: text) {
                        print(text)
                    }
                    .frame(height: 64)
                    .cornerRadius(15)
                    .padding(.horizontal,20)
                }
                Button {
                    print("Delet Account")
                } label: {
                    Text("Delete Account")
                    .foregroundColor(Color(hex: 0xDDE7FF))
                    .underline()
                }
                .padding(.top, 30)
                
                Spacer()
            }
        }
    }
}

struct BMCMeMainCell: View {
    let title: String
    let completion: (() -> ())?
    
    var body: some View {
        ZStack {
            Color(hex: 0x213358)
            HStack {
                Text(title)
                    .foregroundColor(Color(hex:0xDDE7FF))
                    .font(.body)
                    .padding(.leading,16)
                Spacer()
              Image.BMC("btn_arrows_right_big_gray")
                .padding(.trailing,16)
                .onTapGesture {
                  completion?()
                }
            }
            
        }
    }
}

struct BMCMeMainView_Previews: PreviewProvider {
    static var previews: some View {
        BMCMeMainView()
    }
}
