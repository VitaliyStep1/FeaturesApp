//
//  FeaturesAppApp.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 23.08.2024.
//

import SwiftUI
enum LaunchWithScreenEnum {
  case production
  case debugTicTacToeScreenView
}

@main
struct FeaturesAppApp: App {
  
  var body: some Scene {
    WindowGroup {
      switch Constants.launchWithScreenEnum {
      case .production:
        SplashScreenView()
      case .debugTicTacToeScreenView:
        TicTacToeScreenView(rows: 3)
      }
    }
  }
}
