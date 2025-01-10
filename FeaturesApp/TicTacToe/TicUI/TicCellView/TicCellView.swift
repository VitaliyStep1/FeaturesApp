//
//  TicCellView.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 01.09.2024.
//

import SwiftUI

protocol TicCellViewDelegate: AnyObject {
  func cellWasTapped(row: Int, column: Int)
}

struct TicCellView: View {
  let row: Int
  let column: Int
  let ticCellEnum: TicCellEnum
  let signWidth: Double
  let signHeight: Double
  weak var delegate: TicCellViewDelegate?
  var body: some View {
    ZStack {
      switch ticCellEnum {
      case .emptyTicCell:
        Spacer()
      case .oTicCell:
        TicSignView(signType: .oSign)
          .frame(width: signWidth, height: signHeight)
      case .xTicCell:
        TicSignView(signType: .xSign)
          .frame(width: signWidth, height: signHeight)
      }
      
      Button(action: {
        buttonWasTapped()
      }, label: {
        Text("")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      })
    }
  }
  
  
  func buttonWasTapped() {
//    print("buttonWasTapped called row: \(row), column: \(column)")
    delegate?.cellWasTapped(row: row, column: column)
  }
}

#Preview {
  TicCellView(row: 0, column: 0, ticCellEnum: .xTicCell, signWidth: 100.0, signHeight: 100.0)
}

