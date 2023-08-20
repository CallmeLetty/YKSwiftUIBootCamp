//
//  BMCLoginProgressView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/8/19.
//

import SwiftUI

struct BMCLoginProgressView: View {
    @State private var progress = 0.0
    var body: some View {
        
        ZStack {
            BMCLoginBgView()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .frame(width: 100,height: 100)
                ProgressView(value: progress)
                    .padding(.horizontal, 35)
                ProgressView(timerInterval: Date(), countsDown: true)
                Button("More", action: { progress += 0.05 })
            }
        }

    }
}

struct BMCLoginProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BMCLoginProgressView()
    }
}
