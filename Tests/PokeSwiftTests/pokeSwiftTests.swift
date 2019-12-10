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
    
    wait(for: [expectation], timeout: 3)
  }
  
  // MARK: - Abilities
  
  func test_pokemonModel_aibilites() {
    let expectation = XCTestExpectation(description: "Loading Abilites pokemon apiTest REST Call")
    
    
    PokeSwift.pokemon(name: "ditto") { result in
      switch result {
      case .success(let model):
        XCTAssertEqual(model.abilities.count, 2)
        
        XCTAssertEqual(model.abilities.first!.ability.name, "imposter")
        let url = "https://pokeapi.co/api/v2/ability/150/"
        XCTAssertEqual(model.abilities.first!.ability.url, url)
        XCTAssertEqual(model.abilities.first!.isHidden, true)
        XCTAssertEqual(model.abilities.first!.slot, 3)
        
        expectation.fulfill()
      case .failure(let error):
        XCTFail("\(error)")
        expectation.fulfill()
      }
    }
    
    wait(for: [expectation], timeout: 1)
  }
  
  // MARK: Forms
  
  func test_pokemonModel_forms() {
    let expectation = XCTestExpectation(description: "Loading Abilites pokemon apiTest REST Call")
    
    
    PokeSwift.pokemon(name: "ditto") { result in
      switch result {
      case .success(let model):
        XCTAssertEqual(model.forms.first!.name, "ditto")
        let url = "https://pokeapi.co/api/v2/pokemon-form/132/"
        XCTAssertEqual(model.forms.first!.url, url)
        
        expectation.fulfill()
      case .failure(let error):
        XCTFail("\(error)")
        expectation.fulfill()
      }
    }
    
    wait(for: [expectation], timeout: 1)
  }

  // MARK: Game indices

  func test_pokemonModel_gameIndices() {
    let expectation = XCTestExpectation(description: "Loading Game Indices pokemon apiTest REST Call")

    PokeSwift.pokemon(name: "ditto") { result in
      switch result {
      case .success(let model):
        XCTAssertEqual(model.gameIndices.first!.gameIndex, 132)
        XCTAssertEqual(model.gameIndices.first!.version.name, "white-2")
        let url = "https://pokeapi.co/api/v2/version/22/"
        XCTAssertEqual(model.gameIndices.first!.version.url, url)

        expectation.fulfill()
      case .failure(let error):
        XCTFail("\(error)")
        expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 1)
  }

  // MARK: Held Items

  func test_pokemonModel_heldItems() {
    let expectation = XCTestExpectation(description: "Loading Game Indices pokemon apiTest REST Call")

    PokeSwift.pokemon(name: "ditto") { result in
      switch result {
      case .success(let model):
        XCTAssertEqual(model.heldItems.first!.item.name, "metal-powder")
        let url = "https://pokeapi.co/api/v2/item/234/"
        XCTAssertEqual(model.heldItems.first!.item.url, url)


        XCTAssertEqual(model.heldItems.first!.versionDetails.first!.rarity, 5)
        XCTAssertEqual(model.heldItems.first!.versionDetails.first!.version.name, "ultra-sun")
        let versionURL = "https://pokeapi.co/api/v2/version/29/"
        XCTAssertEqual(model.heldItems.first!.versionDetails.first!.version.url , versionURL)

        expectation.fulfill()
      case .failure(let error):
        XCTFail("\(error)")
        expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 1)
  }

  static var allTests = [
    ("test_pokemonModel_basic", test_pokemonModel_basic),
  ]
}
