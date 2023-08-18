//
//  BMCLoginChooseView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/8/16.
//

import SwiftUI

enum BMTQuestionType: CaseIterable {
case task, healthy, organized, time, emotion, impulsivity, learn, notSure
    var image: Image {
        return Image("Calm anxiety")
    }
    var text: String {
        switch self {
        case .task: return "Stay on task"
        case .healthy: return "Build healthy habits"
        case .organized: return "Become more organized"
        case .time: return "Improve time management"
        case .emotion: return "Manage my emotions"
        case .impulsivity: return "Reduce impulsivity"
        case .learn: return "Learn more about my ADHD"
        case .notSure: return "I’m not sure"
        }
    }
}

struct BMCLoginChooseView: View {
  @State var chosenList: [Int] = []
  @State var continueEnable: Bool = false
  var body: some View {
      ZStack {
          BMCLoginBgView()
          
          ScrollView {
              VStack(alignment: .leading) {
                  Text("What are you hoping to achieve with us?")
                      .foregroundColor(.white)
                      .font(.title)
                      .bold()
                      .padding(.horizontal,20)
                  Text("Select up to 3 that apply")
                      .foregroundColor(.white)
                      .font(.subheadline)
                      .padding(.horizontal,20)
                      .padding(.vertical,10)
                  
                  VStack(spacing: 12) {
                      ForEach(0..<BMTQuestionType.allCases.count,id: \.self) { index in
                          let type = BMTQuestionType.allCases[index]
                          
                          BMCQuestionOption(image: type.image,
                                            question: type.text,
                                            index: index, completion: { chosen in
                              if chosen {
                                  chosenList.append(index)
                              } else {
                                  chosenList.removeAll(where: {$0 == index})
                              }
                              continueEnable = chosenList.count > 0
                          })
                              .padding(.horizontal, 20)
                              .frame(height: 55)
                      }
                  }
                  
              }
          }
          
          VStack {
              Spacer()
              BMCLoginContinueButton(continueEnable: $continueEnable)
              
          }
      }
  }
}

struct BMCQuestionOption: View {
    let image: Image
    let question: String
    let index: Int
    let completion: ((Bool) -> ())?
    
    @State private var chosen: Bool = false
    
    var body: some View {
        Button {
            chosen.toggle()
            completion?(chosen)
        } label: {
            HStack() {
                image
                    .padding(.leading, 17)
                    .padding(.trailing, 13)
                Text(question)
                    .foregroundColor(.white)
                    .font(.body)
                Spacer()
            }
        }
        .frame(width: 335,height: 55)
        .background(Color(hex: 0x1E3564))
        .cornerRadius(27.5)
        .overlay(
            RoundedRectangle(cornerRadius: 27.5, style: .continuous)
                 .stroke(chosen ? Color(hex: 0x83D6FF) : .clear, lineWidth: 2)
        )
    }
}

struct BMCLoginChooseView_Previews: PreviewProvider {
    static var previews: some View {
        BMCLoginChooseView()
    }
}
