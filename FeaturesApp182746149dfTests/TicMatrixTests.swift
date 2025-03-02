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
}
