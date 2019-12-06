import XCTest
@testable import PokeSwift

/// This file is making a REST call against the PokemonAPI and will
/// be removed after the Package will be released. (only for testing purpose)
final class PokeSwiftTests: XCTestCase {
  func test_pokemonModel_basic() {
    let expectation = XCTestExpectation(description: "Loading pokemon apiTest REST Call")
    
    
    PokeSwift.pokemon(name: "ditto") { result in
      switch result {
      case .success(let model):
        
        XCTAssertEqual(model.id, 132)
        XCTAssertEqual(model.name, "ditto")
        XCTAssertEqual(model.baseExperience, 101)
        XCTAssertEqual(model.height, 3)
        XCTAssertEqual(model.isDefault, true)
        let encounterURL = "https://pokeapi.co/api/v2/pokemon/132/encounters"
        XCTAssertEqual(model.locationAreaEncounters, encounterURL)
        XCTAssertEqual(model.order, 197)
        XCTAssertEqual(model.weight, 40)
        
        
        expectation.fulfill()
      case .failure(let error):
        XCTFail("\(error)")
        expectation.fulfill()
      }
    }
    
    wait(for: [expectation], timeout: 1)
  }
  
  // MARK: - Abilities
  
  func test_pokemonModel_aibilites() {
    let expectation = XCTestExpectation(description: "Loading Abilites pokemon apiTest REST Call")
    
    
    PokeSwift.pokemon(name: "ditto") { result in
      switch result {
      case .success(let model):
        

        expectation.fulfill()
      case .failure(let error):
        XCTFail("\(error)")
        expectation.fulfill()
      }
    }
    
    wait(for: [expectation], timeout: 1)
  }
  
  // MARK
  
  static var allTests = [
    ("test_pokemonModel_basic", test_pokemonModel_basic),
  ]
}
