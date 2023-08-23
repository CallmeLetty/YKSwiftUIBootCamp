//
//  BMCSubScriptionInfo.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/8/23.
//

import SwiftUI

struct BMCSubScriptionView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color(hex:0x0A1F54)
              .edgesIgnoringSafeArea(.all)
            Image.BMC("prime_bg")?
                .resizable()
                .frame(width: .infinity)
                .aspectRatio(contentMode: .fit)
              .edgesIgnoringSafeArea(.all)
            
            VStack() {
                HStack {
                    Text("How your free trial")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                    .padding(.horizontal,20)
                    Spacer()
                }
                .padding(.bottom, 1)
                
                HStack {
                    Text("Begin your journey with 3 days free trial")
                        .foregroundColor(Color(hex: 0xDDE7FF).opacity(0.6))
                        .font(.system(size: 16))
                    .padding(.horizontal,20)
                    Spacer()
                }
                .padding(.bottom, 1)
                
                BMCSubScriptionInfo()
                    .frame(width: UIScreen.main.bounds.width - 40,height: 229)
            }
        }
    }
}

struct BMCSubScriptionOptions: View {
    
    var body: some View {
        ScrollView {
            ZStack {
                Image.BMC("prime_line")?
                    .position(x:11)
                
            }
        }
    }
}

struct BMCSubScriptionInfo: View {
    private var infoList: [InfoVM] =
    [InfoVM(imageName: "prime_icon1",title: "Today", subtitle: "Learn about how ADHD impacts you and what you can do."),
     InfoVM(imageName: "prime_icon2",title: "Day 3", subtitle: "Receive strategies for managing your symptoms and improving your overall functioning."),
    InfoVM(imageName: "prime_icon3",title: "Day 7", subtitle: "Master the core of ADHD")]
    var body: some View {
        ScrollView {
            ZStack(alignment: .leading) {
                HStack {
                    Image.BMC("prime_line")?
                        .resizable()
                        .frame(width: 8,height: 280)
                    
                    Spacer()
                }
                    
                ForEach(infoList, id: \.self) { info in
                    
                }
            }
        }
    }
}

private struct InfoVM {
    var imageName: String
    var title: String
    var subtitle: String
}

struct BMCSubScriptionView_Previews: PreviewProvider {
    static var previews: some View {
        BMCSubScriptionView()
    }
}
