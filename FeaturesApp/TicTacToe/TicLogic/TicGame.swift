//
//  TicGame.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 05.09.2024.
//

import Foundation
import Combine

class TicGame: TicGameProtocol {
  private let firstMove: TicSign = .o
  private var matrix: TicMatrix<TicSign>?
  private let subject = CurrentValueSubject<TicGameState, Never>(.notStarted)
  
  func startNewGame(rowsOrColumns: Int) {
    let gameState = calculateNewState(currentState: subject.value, action: .startNewGame(n: rowsOrColumns))
    subject.send(gameState)
  }
  
  func takeGameStatePublisher() -> CurrentValueSubject<TicGameState, Never> {
    return subject
  }
  
  func cellWasTapped(row: Int, column: Int) {
    let gameState = calculateNewState(currentState: subject.value, action: .clickCell(row: row, column: column))
    subject.send(gameState)
    
//    let currentValue = matrix?.values[row][column]
//    if currentValue == nil {
//      let gameState = subject.value
//      
//      if case let .inProgress(fieldValues, nextMove) = gameState {
//        self.matrix?.changeValue(row: row, column: column, newValue: nextMove)
//        
//        let isGameFinished = isGameFinished(matrix: self.matrix)
//        if isGameFinished {
//          
//        } else {
//          let nextSign = nextMove.nextSign
//          subject.send(.inProgress(fieldValues: matrix?.values ?? [], nextMove: nextSign))
//        }
//      }
//    }
  }
  
  private func isGameFinished(matrix: TicMatrix<TicSign>?) -> Bool {
    return false
  }
  
  private func calculateNewState(currentState: TicGameState, action: TicAction) -> TicGameState {
//    let newState: TicGameState
//    switch action {
//    case .startNewGame(let n):
//      let newMatrix = takeMatrixForNewGame(n: n)
//      let nextMoveSign = takeNextMoveSignForNewGame()
//      newState = .inProgress(fieldValues: newMatrix.values, nextMove: nextMoveSign)
//    case .clickCell(let row, let column):
//      switch currentState {
//      case .notStarted:
//        newState = currentState
//      case .inProgress(let fieldValues, let nextMove):
//        let isFreeCell = isFreeCell(fieldValues: fieldValues, row: row, column: column)
//        if isFreeCell {
//          
//        } else {
//          newState = currentState
//        }
//      case .finished(let fieldValues, let winner):
//        newState = currentState
//      }
//    }
//    return newState
    return TicGameState.notStarted
  }
  
//  private func takeMatrixForNewGame(n: Int) -> TicMatrix<TicSign> {
//    return TicMatrix(n: n)
//  }
  
  private func takeFieldValuesForNewGame(n: Int) -> [[TicSign?]] {
    let rows = n
    let columns = n
    var values: [[TicSign?]] = []
    for _ in 0..<rows {
      var rowValues:[TicSign?] = []
      for _ in 0..<columns {
        rowValues.append(nil)
      }
      values.append(rowValues)
    }
    return values
  }
  
  private func takeNextMoveSignForNewGame() -> TicSign {
    return firstMove
  }
  
  private func isFreeCell(fieldValues: [[TicSign?]], row: Int, column: Int) -> Bool {
    if fieldValues.count > row, fieldValues[row].count > column {
      return fieldValues[row][column] == nil
    } else {
      return false
    }
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
