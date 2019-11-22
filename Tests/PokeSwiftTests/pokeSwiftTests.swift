import XCTest
@testable import PokeSwift

final class PokeSwiftTests: XCTestCase {
    func testExample() {
//      let testPokemon = Pokemon(
//        id: 1,
//        name: "Charmander",
//        height: 1,
//        order: 1,
//        weight: 1
//      )
      
      PokeSwift.pokemon(name: "charmander")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
