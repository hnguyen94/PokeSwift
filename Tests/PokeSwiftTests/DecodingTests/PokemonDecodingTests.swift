import XCTest
@testable import PokeSwift

final class PokemonDecodingTests: XCTestCase {
  
  var sut: Pokemon!
  
  // MARK: - Test Setup
  
  override func setUp() {
    super.setUp()
    
    let testBundle = Bundle(for: type(of: self))
    guard
      let fileURL = testBundle.url(forResource: "pokemon", withExtension: "json")
      else {
        fatalError("Couldn't find JSON file")
    }

    let data = try! Data(contentsOf: fileURL)
    let decoder = JSONDecoder()
    
    // given
    sut = try! decoder.decode(Pokemon.self, from: data)
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  // MARK: - Test Cases
  
  func skipped_test_pokemon_baseExerience() {
    // then
    XCTAssertEqual(sut.baseExperience, 1)
  }
}
