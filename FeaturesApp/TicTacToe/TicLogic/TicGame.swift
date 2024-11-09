//
//  TicGame.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 05.09.2024.
//

import Foundation
import Combine

class TicGame: TicGameProtocol {
  private var matrix: TicMatrix<TicSignType>?
  private let subject = CurrentValueSubject<TicGameState, Never>(.notStarted)
  
  func startNewGame(rowsOrColumns: Int) {
    matrix = TicMatrix(n: rowsOrColumns)
    if let matrix {
      subject.send(.inProgress(fieldValues: matrix.values))
    }
  }
  
  func takeGameStatePublisher() -> CurrentValueSubject<TicGameState, Never> {
    return subject
  }
  
  func cellWasTapped(row: Int, column: Int) {
    
  }
  
  
//  func startNewGame() {
//    matrix = takeEmptyMatrix(rows: rows)
//  }
//  
//  private func takeEmptyMatrix(rows: Int) -> [[TicValue]] {
//    let columns = rows
//    var matrix:[[TicValue]] = [[]]
//    for row in 0..<rows {
//      var rowValues: [TicValue] = []
//      for column in 0..<columns {
//        rowValues.append(.empty)
//      }
//      matrix.append(rowValues)
//    }
//    return matrix
//  }
//  
//  func isGameFinished() -> Bool {
//    return false
//  }
}
