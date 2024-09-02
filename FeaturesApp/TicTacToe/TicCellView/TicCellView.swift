//
//  TicCellView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 01.09.2024.
//

import SwiftUI

struct TicCellView: View {
  @State var ticCellEnum: TicCellEnum
  let signWidth: Double
  let signHeight: Double
  var body: some View {
    switch ticCellEnum {
    case .emptyTicCell:
      Spacer()
    case .oTicCell:
      let lineWidth = signWidth * 0.14
        Circle()
          .strokeBorder(Color.blue, lineWidth: lineWidth)
          .frame(width: signWidth, height: signHeight)
    case .xTicCell:
      let lineWidth = signWidth * 0.14
      Path { path in
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: signWidth, y: signHeight))
        path.move(to: CGPoint(x: signWidth, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: signHeight))
      }
      .stroke(.blue, lineWidth: lineWidth)
      .frame(width: signWidth, height: signHeight)
    }
  }
  
  
}

#Preview {
  TicCellView(ticCellEnum: .xTicCell, signWidth: 100.0, signHeight: 100.0)
}

