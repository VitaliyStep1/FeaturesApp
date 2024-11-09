//
//  TicScreenViewModel.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 07.09.2024.
//

import Foundation
import Combine

class TicScreenViewModel: ObservableObject, TicCellViewDelegate {
  @Published var fieldValues: [[TicSignType?]] = []
  @Published var winnerSignType: TicSignType?
  @Published var winCoordinates: [[TicCoordinate]]?
  @Published var isGameOver: Bool = false
  private let game: TicGameProtocol = TicGame()
  private let optionsService: TicOptionsServiceProtocol = TicOptionsService()
  private var gameStatePublisher: CurrentValueSubject<TicGameState, Never>?
  
  
  func viewAppeared() {
    subscribeForGameState()
    startNewGame()
  }
  
  func fieldWasTapped(row: Int, column: Int) {
    
  }
  
  func newGameButtonTapped() {
    startNewGame()
  }
  
  private func startNewGame() {
    let ticOptions = optionsService.takeOptions()
    let rowsOrColumns = ticOptions.rowsOrColumns
    game.startNewGame(rowsOrColumns: rowsOrColumns)
  }
  
  private func subscribeForGameState() {
    let gameStatePublisher = game.takeGameStatePublisher()
    _ = gameStatePublisher.sink { gameState in
      switch gameState {
      case .notStarted:
        self.fieldValues = []
        self.winnerSignType = nil
        self.winCoordinates = nil
        self.isGameOver = false
      case .inProgress(let fieldValues):
        self.fieldValues = fieldValues
        self.winnerSignType = nil
        self.winCoordinates = nil
        self.isGameOver = false
      case .win(let fieldValues, let winnerSignType, let winCoordinates):
        self.fieldValues = fieldValues
        self.winnerSignType = winnerSignType
        self.winCoordinates = winCoordinates
        self.isGameOver = true
      case .draw(let fieldValues):
        self.fieldValues = fieldValues
        self.winnerSignType = nil
        self.winCoordinates = nil
        self.isGameOver = true
      }
    }
  }
  
  func cellWasTapped(row: Int, column: Int) {
    print("cellWasTapped row: \(row), column: \(column)")
    game.cellWasTapped(row: row, column: column)
  }
}
