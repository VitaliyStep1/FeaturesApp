//
//  TicScreenViewModel.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 07.09.2024.
//

import Foundation
import Combine

class TicScreenViewModel: ObservableObject {
  @Published var fieldValues: [[TicSignType?]] = []
}
