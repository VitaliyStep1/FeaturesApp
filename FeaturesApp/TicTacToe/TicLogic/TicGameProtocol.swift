//
//  TicGameProtocol.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 09.09.2024.
//

import Foundation
import Combine

protocol TicGameProtocol {
  func startNewGame(rowsOrColumns: Int)
  func takeGameStatePublisher() -> CurrentValueSubject<TicGameState, Never>
  func cellWasTapped(row: Int, column: Int)
}
