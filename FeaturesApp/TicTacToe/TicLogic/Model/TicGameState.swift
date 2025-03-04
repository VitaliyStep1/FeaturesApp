//
//  TicGameState.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 09.09.2024.
//

import Foundation

enum TicGameState {
  case notStarted
  case inProgress(matrix: TicMatrix<TicSign>, nextMove: TicSign)
  case finished(matrix: TicMatrix<TicSign>, winner: TicWinner)
}
