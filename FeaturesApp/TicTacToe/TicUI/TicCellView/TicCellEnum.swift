//
//  TicCellEnum.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 01.09.2024.
//

import Foundation

enum TicCellEnum {
  case emptyTicCell
  case oTicCell
  case xTicCell
  
  init(signType: TicSignType?) {
    if let signType {
      switch signType {
        case .oSign: self = .oTicCell
        case .xSign: self = .xTicCell
      }
    } else {
      self = .emptyTicCell
    }
  }
}
