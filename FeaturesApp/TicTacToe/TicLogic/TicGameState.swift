//
//  TicGameState.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 09.09.2024.
//

import Foundation

enum TicGameState {
  case notStarted
  case inProgress(fieldValues: [[TicSignType?]], nextMove: TicSignType)
  case finished(fieldValues: [[TicSignType?]], winner: TicWinner)
}
