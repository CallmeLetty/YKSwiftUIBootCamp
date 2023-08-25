//
//  BMCSubScriptionInfo.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/8/23.
//

import SwiftUI

struct BMCSubScriptionView: View {
    @State var optionList: [OptionVM] = [
        OptionVM(wholePrice: "$49.99",
                 singlePrice: "$0.96",
                 perUnit: " Per Week",
                 perMinUnit: "1 Year"),
        OptionVM(wholePrice: "$49.99",
                 singlePrice: "$0.96",
                 perUnit: " Per Week",
                 perMinUnit: "1 Year"),
        OptionVM(wholePrice: "$4.99",
                 singlePrice: "$0.96",
                 perUnit: " Per Week",
                 perMinUnit: "1 Year")
    ]
    
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
                .padding(.bottom, 28)
                
                BMCSubScriptionInfo()
                    .frame(width: Frame.SCREEN_WIDTH - 40,height: Frame.scale * 229)
                
                BMCSubScriptionOptions(optionList: $optionList)
                    .frame(width: Frame.SCREEN_WIDTH - 40,height: CGFloat((optionList.count - 1) * 75) + 77)
                    .padding(.bottom, 10)
                
                Text("Get a 3-day free trial")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: 0xDDE7FF))
                    .padding(.bottom, 16)
                
                Button {
                    print("Continue Subscription")
                    print(Frame.scale)
                } label: {
                    Text("Continue")
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(Color(hex: 0x131C41))
                        .frame(width: Frame.SCREEN_WIDTH - 27 * 2,
                        height: 58)
                        .background(Color(hex: 0x83D6FF))
                        .cornerRadius(29)
                }
                .padding(.bottom, 21)

                BMCSubscriptionBottomView()
            }
        }
    }
}

struct BMCSubScriptionOptions: View {
    
    @State var selectedIndex: Int = 0
    @State var popularIndex: Int = 0
    @State var allInfoMode: Bool = true
    
    @Binding var optionList: [OptionVM]
    
    var body: some View {
        
        VStack() {
            ForEach(0 ..< optionList.count, id:\.self) { index in
                let option = optionList[index]
                let selected = (selectedIndex == index)
                let popular = (popularIndex == index)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selected ? Color(hex: 0x83D6FF) : .clear,lineWidth: 1.5)
                        .background(Color(hex: 0x1E3564))
                        .cornerRadius(10)
                        .frame(width: Frame.SCREEN_WIDTH - 22 * 2,
                               height: popular ? 77 : 60)
                    if popular {
                        BMCSubScriptionOptionPopular()
                    }
                    
                    VStack {
                        HStack {
                            Text(option.wholePrice)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Text(option.singlePrice)
                                .font(.system(size: 16))
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.top, popular ? 15 : 0)
                        .frame(width: Frame.SCREEN_WIDTH - 35 * 2)
                        
                        HStack {
                            Text(option.perUnit)
                                .font(.system(size: 12))
                                .foregroundColor(.white).opacity(0.8)
                            Spacer()
                            Text(option.perMinUnit)
                                .font(.system(size: 12))
                                .foregroundColor(.white).opacity(0.8)
                        }
                        .frame(width: Frame.SCREEN_WIDTH - 35 * 2)
                        if popular {
                            Spacer()
                        }
                    }
                    .frame(height: popular ? 77 : 60)
                    
                    if popular {
                        HStack {
                            Spacer()
                            VStack {
                                BMCSubscriptionSaveView()
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
        
    }
}

fileprivate struct BMCSubScriptionOptionPopular: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    Color(hex: 0x22EBCC)
                        .frame(width: Frame.SCREEN_WIDTH - 22 * 2,
                               height: 22)
                        .padding(.bottom,1)
                        .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                    
                    Text("Most Popular")
                        .foregroundColor(Color(hex: 0x253756))
                        .font(.system(size: 12))
                }
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
                .padding(.leading,10)
                    
                VStack {
                    ForEach(infoList, id: \.self) { info in
                        VStack(alignment: .leading) {
                            HStack {
                                Image.BMC(info.imageName)
                                
                                Text(info.title)
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            Text(info.subtitle)
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: 0xDDE7FF))
                                .padding(.leading, 40)
                            
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct BMCSubscriptionBottomView: View {
    let list = [
        "Privacy Police",
        "Restore",
        "Terms of Services"]
    var body: some View {
        HStack {
            ForEach(0 ..< list.count, id:\.self) { index in
                if index > 0 {
                    Spacer()
                }
                Button {
                    print(list[index])
                } label: {
                    Text(list[index])
                        .foregroundColor(Color(hex: 0xDDE7FF).opacity(0.5))
                        .font(.system(size: 12))
                        .underline()
                }

            }
        }
        .frame(width: Frame.SCREEN_WIDTH - 20 * 2)
    }
}

struct BMCSubscriptionSaveView: View {
    private let bgColors =  [Color(hex: 0xF5881C),
                             Color(hex: 0xFF3F2F)]
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(
                    LinearGradient(gradient: Gradient(colors: bgColors),
                                   startPoint: .leading,
                                   endPoint: .trailing)
            )
                .frame(width: 66.5,
                       height: 21)

                .padding(.bottom,1)
                .cornerRadius(10, corners: [.bottomLeft, .topRight,.topLeft])
            
            Text("SAVE 80%")
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 11))
        }
    }
}

struct InfoVM: Hashable {
    var imageName: String
    var title: String
    var subtitle: String
}

struct OptionVM: Hashable {
    var wholePrice: String
    var singlePrice: String
    var perUnit: String
    var perMinUnit: String
}

struct BMCSubScriptionView_Previews: PreviewProvider {
    static var previews: some View {
        BMCSubScriptionView()
    }
}
