//
//  BMCMaskView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/9/8.
//

import SwiftUI

struct BMCMaskView: View {
  

  var body: some View {
    ZStack {
  
      Color.blue
  
      Circle()
        .fill(Color.pink)
        .frame(height: 200)
        .offset(x: 50, y: 100)
  
      BlurView(style: .dark, frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
  
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct BlurView: UIViewRepresentable {

  let style: UIBlurEffect.Style
  let frame: CGRect

  func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
    let view = UIView(frame: .zero)
    view.backgroundColor = .clear
    let blurEffect = UIBlurEffect(style: style)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.translatesAutoresizingMaskIntoConstraints = false
    view.insertSubview(blurView, at: 0)
    NSLayoutConstraint.activate([
      blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
    ])

    let clipPath = UIBezierPath(rect: UIScreen.main.bounds)
    
    let blurPath = UIBezierPath(rect: frame)

    clipPath.append(blurPath)

    let layer = CAShapeLayer()
    layer.path = clipPath.cgPath
    layer.fillRule = .evenOdd
    view.layer.mask = layer
    view.layer.masksToBounds = true

    return view
  }

  func updateUIView(_ uiView: UIView,
                    context: UIViewRepresentableContext<BlurView>) {

    let clipPath = UIBezierPath(rect: UIScreen.main.bounds)

    let circlePath = UIBezierPath(rect: frame)

    clipPath.append(circlePath)

    let layer = CAShapeLayer()
    layer.path = clipPath.cgPath
    layer.fillRule = .evenOdd
    uiView.layer.mask = layer
    uiView.layer.masksToBounds = true

  }

}
struct BMCMaskView_Previews: PreviewProvider {
    static var previews: some View {
        BMCMaskView()
    }
}
