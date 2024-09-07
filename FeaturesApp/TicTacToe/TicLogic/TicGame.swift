//
//  TicGame.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 05.09.2024.
//

import Foundation

class TicGame {
  let rows: Int = 3
  var matrix: [[TicValue]] = [[]]
  
  func startNewGame() {
    matrix = takeEmptyMatrix(rows: rows)
  }
  
  private func takeEmptyMatrix(rows: Int) -> [[TicValue]] {
    let columns = rows
    var matrix:[[TicValue]] = [[]]
    for row in 0..<rows {
      var rowValues: [TicValue] = []
      for column in 0..<columns {
        rowValues.append(.empty)
      }
      matrix.append(rowValues)
    }
    return matrix
  }
  
  func isGameFinished() -> Bool {
    return false
  }
}
