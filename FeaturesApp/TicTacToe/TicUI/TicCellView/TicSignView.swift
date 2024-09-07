//
//  TicSignView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 02.09.2024.
//

import SwiftUI

struct TicSignView: View {
  let signType: TicSignType
  var body: some View {
    GeometryReader { geometry in
      let viewWidth = geometry.size.width
      let viewHeight = geometry.size.height
      let minSizeValue = min(viewWidth, viewHeight)
      
      switch signType {
      case .oSign:
        let lineWidth = minSizeValue * 0.12
        Circle()
          .strokeBorder(Color.blue, lineWidth: lineWidth)
      case .xSign:
        let lineWidth = minSizeValue * 0.12
        let offset = sqrt(2.0) * lineWidth / 4.0
        Path { path in
          path.move(to: CGPoint(x: offset, y: offset))
          path.addLine(to: CGPoint(x: minSizeValue-offset, y: minSizeValue-offset))
          path.move(to: CGPoint(x: minSizeValue-offset, y: offset))
          path.addLine(to: CGPoint(x: offset, y: minSizeValue-offset))
        }
        .stroke(.blue, lineWidth: lineWidth)
      }
    }
  }
}

#Preview {
  TicSignView(signType: .xSign)
}
