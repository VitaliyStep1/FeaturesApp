//
//  TicMatrixTests.swift
//  FeaturesApp182746149dfTests
//
//  Created by Vitaliy Stepanenko on 02.03.2025.
//

import Testing
@testable import FeaturesApp182746149df

struct TicMatrixTests {
  
  @Test("TicMatrix init test n")
  func ticMatrix_init_n() async throws {
    //Arrange
    let sut = TicMatrix<Int>(n: 5)
    //Assert
    #expect(sut.n == 5)
  }
  
  @Test("TicMatrix init test values")
  func ticMatrix_init_values() async throws {
    //Arrange
    let sut = TicMatrix<Int>(n: 5)
    //Assert
    #expect(sut.values.count == 5)
    for index in sut.values.indices {
      #expect(sut.values[index].count == 5)
    }
    for index1 in sut.values.indices {
      for index2 in sut.values[index1].indices {
        let value = sut.values[index1][index2]
        #expect(value == nil)
      }
    }
  }
  
  @Test("TicMatrix changeValue test changed value")
  func ticMatrix_changeValue_testChangedValue() async throws {
    var sut = TicMatrix<Int>(n: 3)
    sut.changeValue(row: 1, column: 1, value: 10)
    #expect(sut.values[1][1] == 10)
  }
  
  @Test("TicMatrix changeValue test not existed indices")
  func ticMatrix_changeValue_testNotExistedIndices() async throws {
    var sut = TicMatrix<Int>(n: 3)
    sut.changeValue(row: 1, column: 5, value: 10)
    sut.changeValue(row: 5, column: 1, value: 10)
  }
  
  @Test("TicMatrix takeLinesCoordinatesWithSameValues when empty matrix")
  func ticMatrix_takeLinesCoordinatesWithSameValues_whenEmpty() {
    //Arrange
    let sut = TicMatrix<Int>(n: 3)
    //Act
    let linesCoordinates = sut.takeLinesCoordinatesWithSameValues()
    //Assert
    #expect(linesCoordinates.count == 0)
  }
  
  @Test("TicMatrix takeLinesCoordinatesWithSameValues when no lines")
  func ticMatrix_takeLinesCoordinatesWithSameValues_whenNoLines() {
    //Arrange
    var sut = TicMatrix<Int>(n: 3)
    sut.changeValue(row: 0, column: 0, value: 1)
    sut.changeValue(row: 0, column: 1, value: 2)
    sut.changeValue(row: 0, column: 2, value: 1)
    sut.changeValue(row: 1, column: 0, value: 1)
    sut.changeValue(row: 1, column: 1, value: 2)
    sut.changeValue(row: 1, column: 2, value: 1)
    sut.changeValue(row: 2, column: 0, value: 2)
    sut.changeValue(row: 2, column: 1, value: 1)
    sut.changeValue(row: 2, column: 2, value: 2)
    //Act
    let linesCoordinates = sut.takeLinesCoordinatesWithSameValues()
    //Assert
    #expect(linesCoordinates.count == 0)
  }
  
  @Test("TicMatrix takeLinesCoordinatesWithSameValues when one line")
  func ticMatrix_takeLinesCoordinatesWithSameValues_whenOneLine() {
    //Arrange
    var sut = TicMatrix<Int>(n: 3)
    sut.changeValue(row: 0, column: 0, value: 1)
    sut.changeValue(row: 0, column: 1, value: 2)
    sut.changeValue(row: 0, column: 2, value: 1)
    sut.changeValue(row: 1, column: 0, value: 1)
    sut.changeValue(row: 1, column: 1, value: 2)
    sut.changeValue(row: 1, column: 2, value: 1)
    sut.changeValue(row: 2, column: 0, value: 2)
    sut.changeValue(row: 2, column: 1, value: 1)
    sut.changeValue(row: 2, column: 2, value: 1)
    //Act
    let linesCoordinates = sut.takeLinesCoordinatesWithSameValues()
    //Assert
    #expect(linesCoordinates.count == 1)
    guard linesCoordinates.count > 0 else {
      return
    }
    #expect(linesCoordinates[0].contains(where: { coordinate in
      coordinate.row == 0 && coordinate.column == 2
    }))
    #expect(linesCoordinates[0].contains(where: { coordinate in
      coordinate.row == 1 && coordinate.column == 2
    }))
    #expect(linesCoordinates[0].contains(where: { coordinate in
      coordinate.row == 2 && coordinate.column == 2
    }))
  }
  
  @Test("TicMatrix takeLinesCoordinatesWithSameValues when two lines")
  func ticMatrix_takeLinesCoordinatesWithSameValues_whenTwoLines() {
    //Arrange
    var sut = TicMatrix<Int>(n: 3)
    sut.changeValue(row: 0, column: 0, value: 1)
    sut.changeValue(row: 0, column: 1, value: 1)
    sut.changeValue(row: 0, column: 2, value: 2)
    sut.changeValue(row: 1, column: 0, value: 1)
    sut.changeValue(row: 1, column: 1, value: 1)
    sut.changeValue(row: 1, column: 2, value: 2)
    sut.changeValue(row: 2, column: 0, value: 2)
    sut.changeValue(row: 2, column: 1, value: 2)
    sut.changeValue(row: 2, column: 2, value: 2)
    //Act
    let linesCoordinates = sut.takeLinesCoordinatesWithSameValues()
    //Assert
    #expect(linesCoordinates.count == 2)
    guard linesCoordinates.count > 0 else {
      return
    }
    let allCoordinates = linesCoordinates.flatMap(\.self)
    
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 0 && coordinate.column == 2
    }))
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 1 && coordinate.column == 2
    }))
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 2 && coordinate.column == 2
    }))
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 2 && coordinate.column == 0
    }))
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 2 && coordinate.column == 1
    }))
  }
  
  @Test("TicMatrix takeLinesCoordinatesWithSameValues when two lines diagonal")
  func ticMatrix_takeLinesCoordinatesWithSameValues_whenTwoLinesDiagonal() {
    //Arrange
    var sut = TicMatrix<Int>(n: 3)
    sut.changeValue(row: 0, column: 0, value: 1)
    sut.changeValue(row: 0, column: 1, value: 2)
    sut.changeValue(row: 0, column: 2, value: 1)
    sut.changeValue(row: 1, column: 0, value: 2)
    sut.changeValue(row: 1, column: 1, value: 1)
    sut.changeValue(row: 1, column: 2, value: 2)
    sut.changeValue(row: 2, column: 0, value: 1)
    sut.changeValue(row: 2, column: 1, value: 2)
    sut.changeValue(row: 2, column: 2, value: 1)
    //Act
    let linesCoordinates = sut.takeLinesCoordinatesWithSameValues()
    //Assert
    #expect(linesCoordinates.count == 2)
    guard linesCoordinates.count > 0 else {
      return
    }
    let allCoordinates = linesCoordinates.flatMap(\.self)
    
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 0 && coordinate.column == 0
    }))
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 0 && coordinate.column == 2
    }))
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 1 && coordinate.column == 1
    }))
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 2 && coordinate.column == 0
    }))
    #expect(allCoordinates.contains(where: { coordinate in
      coordinate.row == 2 && coordinate.column == 2
    }))
  }
  
  @Test("TicMatrix isEmptyCell")
  func tickMatrix_isEmptyCell() {
    var sut = TicMatrix<Int>(n: 3)
    let row = 0
    let column = 0
    let isEmpty1 = sut.isEmptyCell(row: row, column: column)
    #expect(isEmpty1)
    sut.changeValue(row: row, column: column, value: 1)
    let isEmpty2 = sut.isEmptyCell(row: row, column: column)
    #expect(!isEmpty2)
  }
}
