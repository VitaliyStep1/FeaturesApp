//
//  FeaturesAppApp.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 23.08.2024.
//

import SwiftUI

@main
struct FeaturesAppApp: App {
  
  var body: some Scene {
    WindowGroup {
      switch Constants.launchWithScreenEnum {
      case .productionLaunchFromSplashScreenView:
        SplashScreenView()
      case .debugLaunchFromTicScreenView:
        TicScreenView(rows: 3)
      }
    }
  }
}
