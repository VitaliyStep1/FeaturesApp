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
  @Published var nextMove: TicSignType? = nil
  private let game: TicGameProtocol = TicGame()
  private let optionsService: TicOptionsServiceProtocol = TicOptionsService()
  private var gameStatePublisher: CurrentValueSubject<TicGameState, Never>?
  
  var cancellables = Set<AnyCancellable>()
  
  func viewAppeared() {
    subscribeForGameState()
    startNewGame()
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
//    let gameStatePublisher = game.takeGameStatePublisher()
//    _ = gameStatePublisher.sink { gameState in
//      switch gameState {
//      case .notStarted:
//        self.fieldValues = []
//        self.nextMove = nil
//        self.winnerSignType = nil
//        self.winCoordinates = nil
//        self.isGameOver = false
//      case .inProgress(let fieldValues, let nextMove):
//        self.fieldValues = fieldValues
//        self.nextMove = nextMove
//        self.winnerSignType = nil
//        self.winCoordinates = nil
//        self.isGameOver = false
//      case .win(let fieldValues, let winnerSignType, let winCoordinates):
//        self.fieldValues = fieldValues
//        self.nextMove = nil
//        self.winnerSignType = winnerSignType
//        self.winCoordinates = winCoordinates
//        self.isGameOver = true
//      case .draw(let fieldValues):
//        self.fieldValues = fieldValues
//        self.nextMove = nil
//        self.winnerSignType = nil
//        self.winCoordinates = nil
//        self.isGameOver = true
//      }
//    }
//    .store(in: &cancellables)
  }
  
  func cellWasTapped(row: Int, column: Int) {
    print("cellWasTapped row: \(row), column: \(column)")
    game.cellWasTapped(row: row, column: column)
  }
}
