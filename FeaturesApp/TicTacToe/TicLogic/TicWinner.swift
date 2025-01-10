//
//  TicWinner.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 11.11.2024.
//

enum TicWinner {
  case draw
  case won(sign: TicSign, winCoordinates: [[TicCoordinate]])
}
