//
//  TicMatrix.swift
//  FeaturesApp
//
//  Created by Vitaliy Stepanenko on 05.09.2024.
//

import Foundation

// Only for square matrix
struct TicMatrix<T: Equatable> {
  let n: Int
  private(set) var values: [[T?]] = []
  private var rows: Int {
    return n
  }
  private var columns: Int {
    return n
  }
  
  init(n: Int) {
    self.n = n
    
    var values: [[T?]] = []
    for _ in 0..<rows {
      var rowValues:[T?] = []
      for _ in 0..<columns {
        rowValues.append(nil)
      }
      values.append(rowValues)
    }
    self.values = values
  }
  
  mutating func changeValue(row: Int, column: Int, value: T) {
//    if row < n, column < n {
      values[row][column] = value
//    }
  }
  
  func takeLinesCoordinatesWithSameValues() -> [[TicCoordinate]] {
    let values = self.values
    let possibleLinesCoordinates = takePossibleLinesCoordinates(n: n)
    let linesCoordinates = possibleLinesCoordinates.filter { lineCoordinates in
      isLineContainsOnlySameValues(lineCoordinates: lineCoordinates, values: values)
    }
    return linesCoordinates
  }
  
  func isThereLinesWithOnlyOneTypeOrEmpty() -> Bool {
    return true
  }
  
  private func takePossibleLinesCoordinates(n: Int) -> [[TicCoordinate]] {
    let rows = n
    let columns = n
    var possibleLinesCoordinates: [[TicCoordinate]] = []
    for row in 0..<rows {
      var lineCoordinates: [TicCoordinate] = []
      for column in 0..<columns {
        lineCoordinates.append(TicCoordinate(row: row, column: column))
      }
      possibleLinesCoordinates.append(lineCoordinates)
    }
    
    for column in 0..<columns {
      var lineCoordinates: [TicCoordinate] = []
      for row in 0..<rows {
        lineCoordinates.append(TicCoordinate(row: row, column: column))
      }
      possibleLinesCoordinates.append(lineCoordinates)
    }
    
    var lineCoordinates: [TicCoordinate] = []
    for row in 0..<rows {
      let column = row
      lineCoordinates.append(TicCoordinate(row: row, column: column))
    }
    possibleLinesCoordinates.append(lineCoordinates)
    
    lineCoordinates = []
    for row in 0..<rows {
      let column = columns - 1 - row
      lineCoordinates.append(TicCoordinate(row: row, column: column))
    }
    possibleLinesCoordinates.append(lineCoordinates)
    return possibleLinesCoordinates
  }
  
  private func isLineContainsOnlySameValues(lineCoordinates: [TicCoordinate], values: [[T?]]) -> Bool {
    if lineCoordinates.count > 1 {
      let firstCoordinate = lineCoordinates[0]
      let firstValue = takeValue(values: values, coordinate: firstCoordinate)
      if firstValue == nil {
        return false
      }
      else {
        for i in 1..<lineCoordinates.count {
          let coordinate = lineCoordinates[i]
          let value = takeValue(values: values, coordinate: coordinate)
          if value != firstValue {
            return false
          }
        }
      }
    }
    return true
  }
  
  private func takeValue(values: [[T?]], coordinate: TicCoordinate) -> T? {
    let row = coordinate.row
    let column = coordinate.column
    let value = values[safe: row]?[safe: column] ?? nil
    return value
  }
}
