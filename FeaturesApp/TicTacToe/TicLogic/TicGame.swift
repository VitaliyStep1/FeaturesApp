//
//  TicGame.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 05.09.2024.
//

import Foundation
import Combine

class TicGame: TicGameProtocol {
  private let firstMoveSign: TicSign = .o
  private let subject = CurrentValueSubject<TicGameState, Never>(.notStarted)
  
  func startNewGame(rowsOrColumns: Int, firstMove: TicSign) {
    let gameState = calculateNewState(currentState: subject.value, action: .startNewGame(n: rowsOrColumns))
    subject.send(gameState)
  }
  
  func takeGameStatePublisher() -> CurrentValueSubject<TicGameState, Never> {
    return subject
  }
  
  func cellWasTapped(row: Int, column: Int) {
    let gameState = calculateNewState(currentState: subject.value, action: .clickCell(row: row, column: column))
    subject.send(gameState)
  }
  
  private func isGameFinished(matrix: TicMatrix<TicSign>?) -> Bool {
    return false
  }
  
  private func calculateNewState(currentState: TicGameState, action: TicAction) -> TicGameState {
    let newState: TicGameState
    switch action {
    case .startNewGame(let n):
      let newMatrix = takeMatrixForNewGame(n: n)
      let nextMoveSign = takeNextMoveSignForNewGame()
      newState = .inProgress(matrix: newMatrix, nextMove: nextMoveSign)
    case .clickCell(let row, let column):
      newState = calculateNewStateForClickCellAction(currentState: currentState, row: row, column: column)
    }
    return newState
  }
  
  private func calculateNewStateForClickCellAction(currentState: TicGameState, row: Int, column: Int) -> TicGameState {
    let newState: TicGameState
    switch currentState {
    case .notStarted:
      newState = currentState
    case .inProgress(let matrix, let nextMove):
      let isFreeCell = matrix.isEmptyCell(row: row, column: column)
      if isFreeCell {
        var newMatrix = matrix
        newMatrix.changeValue(row: row, column: column, value: nextMove)
        
        let linesCoordinatesWithSameValues = newMatrix.takeLinesCoordinatesWithSameValues()
        if linesCoordinatesWithSameValues.count > 0 {
          let winner = TicWinner.won(sign: nextMove, winCoordinates: linesCoordinatesWithSameValues)
          newState = .finished(matrix: newMatrix, winner: winner)
        } else {
          let isAnyEmptyCell = newMatrix.isAnyEmptyCell()
          if !isAnyEmptyCell {
            let winner: TicWinner = .draw
            newState = .finished(matrix: newMatrix, winner: winner)
          } else {
            let newNextMove = nextMove.nextSign
            newState = .inProgress(matrix: newMatrix, nextMove: newNextMove)
          }
        }
      } else {
        newState = currentState
      }
    case .finished(_, _):
      newState = currentState
    }
    return newState
  }
  
  private func takeMatrixForNewGame(n: Int) -> TicMatrix<TicSign> {
    return TicMatrix(n: n)
  }
  
  private func takeNextMoveSignForNewGame() -> TicSign {
    return firstMoveSign
  }
}
