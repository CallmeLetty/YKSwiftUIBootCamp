//
//  BMCPageControl.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/8/25.
//

import SwiftUI

struct BMCPageControl: View {
    
    let currentPage: CGFloat
    let pageCount: Int
    let tintColor: Color
    let normalColor: Color

    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            ForEach(0 ..< pageCount) { index in
                let floatIndex = CGFloat(index)
                let percent = 1 - (abs(floatIndex - currentPage) / 1)
                let fixedPercent = percent < 0 ? 0 : percent
                let width: CGFloat = abs(6 * fixedPercent) + 4
                ZStack {
                    normalColor
                    tintColor.opacity(fixedPercent)
                }
                .cornerRadius(2)
                .frame(width: width, height: 4)
            }
        }
    }

}

struct BMCPageControl_Previews: PreviewProvider {
    static var previews: some View {
        BMCPageControl(currentPage: 0, pageCount: 3, tintColor: .white, normalColor: .gray)
    }
}
