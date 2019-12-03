import XCTest
@testable import PokeSwift

/// The test here are doing a REST call against the PokemonAPI and will
/// be removed after the Package will be released.
final class PokeSwiftTests: XCTestCase {
    func test_pokemon_model() {
      let expectation = XCTestExpectation(description: "Loading pokemon apiTest REST Call")
      
      
      PokeSwift.pokemon(name: "ditto") { result in
        switch result {
        case .success(let model):

          XCTAssertEqual(model.id, 123)
          XCTAssertEqual(model.name, "ditto")

          expectation.fulfill()
        case .failure(_):
          expectation.fulfill()
        }
      }

      wait(for: [expectation], timeout: 1)
    }

    static var allTests = [
        ("test_pokemon_model", test_pokemon_model),
    ]
}
