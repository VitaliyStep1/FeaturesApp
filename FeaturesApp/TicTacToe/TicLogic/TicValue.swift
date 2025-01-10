//
//  TicValue.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 05.09.2024.
//

import Foundation

enum TicSign {
  case o
  case x
  
  var nextSign: Self {
    switch self {
    case .o: return .x
    case .x: return .o
    }
  }
}
