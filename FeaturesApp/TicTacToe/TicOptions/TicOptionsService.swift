//
//  TicOptionsService.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 09.09.2024.
//

import Foundation

class TicOptionsService: TicOptionsServiceProtocol {
  
  public func takeOptions() -> TicOptions {
    return TicOptions(rowsOrColumns: 3)
  }
}
