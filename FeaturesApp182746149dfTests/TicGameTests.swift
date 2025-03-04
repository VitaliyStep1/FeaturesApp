//
//  TicGameTests.swift
//  FeaturesApp182746149dfTests
//
//  Created by Vitaliy Stepanenko on 03.03.2025.
//

import Testing
import Combine
@testable import FeaturesApp182746149df

struct TicGameTests {
  
//  private static func isGameStatesEqual(_ state1: TicGameState, _ state2: TicGameState, isIgnoringFieldValues: Bool = false) -> Bool {
//    switch (state1, state2) {
//      case (.notStarted, .notStarted):
//      return true
//    case (.inProgress(let fieldValues1, let nextMove1), .inProgress(let fieldValues2, let nextMove2)):
//      let isFieldValuesEqual: Bool
//      if isIgnoringFieldValues {
//        isFieldValuesEqual = true
//      } else {
//        isFieldValuesEqual = Self.isFieldValuesEqual(fieldValues1: fieldValues1, fieldValues2: fieldValues2)
//      }
//      
//      return nextMove1 == nextMove2 && isFieldValuesEqual
//    case (.finished, .finished):
//      return true
//    default:
//      return false
//    }
//  }
//  
//  private static func isFieldValuesEqual(fieldValues1: [[TicSign?]], fieldValues2: [[TicSign?]]) -> Bool {
//    var isEqual: Bool = true
//    if fieldValues1.count != fieldValues2.count {
//      isEqual = false
//    } else {
//      for i in 0..<fieldValues1.count {
//        if fieldValues1[i].count != fieldValues2[i].count {
//          isEqual = false
//          break
//        } else {
//          for j in 0..<fieldValues1[i].count {
//            if fieldValues1[i][j] != fieldValues2[i][j] {
//              isEqual = false
//              break
//            }
//          }
//        }
//      }
//    }
//    return isEqual
//  }
//  
//  @Test("TicGame before startNewGame was called")
//  func ticGame_beforeStartNewGameWasCalled() async throws {
//    let sut = TicGame()
//    let gameStatePublisher = sut.takeGameStatePublisher()
//    
//    let isNotStarted = Self.isGameStatesEqual(gameStatePublisher.value, .notStarted, isIgnoringFieldValues: true)
//    #expect(isNotStarted)
//  }
//  
//  @Test("TicGame after startNewGame was called")
//  func ticGame_afterStartNewGameWasCalled() {
//    //Arrange
//    let sut = TicGame()
//    let gameStatePublisher = sut.takeGameStatePublisher()
//    var cancellables: Set<AnyCancellable> = []
//    //Assert 1
//    gameStatePublisher.dropFirst().sink { state in
//      let isInProgress = Self.isGameStatesEqual(state, .inProgress(fieldValues: [], nextMove: .o), isIgnoringFieldValues: true)
//      #expect(isInProgress)
//    }.store(in: &cancellables)
//    //Act
//    sut.startNewGame(rowsOrColumns: 3, firstMove: .o)
//    //Assert 2
//    let isInProgress = Self.isGameStatesEqual(gameStatePublisher.value, .inProgress(fieldValues: [], nextMove: .o), isIgnoringFieldValues: true)
//    #expect(isInProgress)
//  }
//  
//  @Test("TicGame cellWasTapped")
//  func ticGame_cellWasTapped() {
//    let sut = TicGame()
//    let gameStatePublisher = sut.takeGameStatePublisher()
//    var cancellables: Set<AnyCancellable> = []
//    
//    sut.startNewGame(rowsOrColumns: 3, firstMove: .o)
//    
//    gameStatePublisher.dropFirst().sink { state in
//      let isInProgressWithNextMoveX = Self.isGameStatesEqual(state, .inProgress(fieldValues: [], nextMove: .x), isIgnoringFieldValues: true)
//      #expect(isInProgressWithNextMoveX)
//    }.store(in: &cancellables)
//    
//    sut.cellWasTapped(row: 0, column: 0)
//  }
}
