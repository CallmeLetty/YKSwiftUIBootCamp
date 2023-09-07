//
//  BMCAnimationView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/9/7.
//

import SwiftUI
import Lottie

struct BMCAnimationView: UIViewRepresentable {
    
  func makeCoordinator() -> Coordinator {
      Coordinator(self)
  }
  
  var name: String!
  @Binding var play:Int
  
  var animationView = LottieAnimationView()

  class Coordinator: NSObject {
      var parent: BMCAnimationView
  
      init(_ animationView: BMCAnimationView) {
          self.parent = animationView
          super.init()
      }
  }

  func makeUIView(context: UIViewRepresentableContext<BMCAnimationView>) -> UIView {
      let view = UIView()
    
      animationView.animation = LottieAnimation.named(name)
      animationView.contentMode = .scaleAspectFit

      animationView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(animationView)

      NSLayoutConstraint.activate([
          animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
          animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
      ])

      return view
  }

  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BMCAnimationView>) {
      animationView.play()
  }

}

struct BMCAnimationContentView: View {
  @State var play = 0
  
  var body: some View {
    VStack{
      BMCAnimationView(name: "love", play: $play)
        .frame(width:100, height:100)
      Button("Play"){ self.play += 1 }
    }
    
  }
}

struct BMCAnimationView_Previews: PreviewProvider {
    static var previews: some View {
      BMCAnimationContentView()
    }
}
