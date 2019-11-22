import XCTest
@testable import PokeSwift

final class EndpointTests: XCTestCase {
  
  func test_EndPointPath() {
    // given
    let sut = Endpoint(path: "test")
    
    // then
    XCTAssertEqual(sut.modifiedPath, "/api/v2/test")
  }
  
  func test_pokemon_path() {
    // given
    let sut = Endpoint.pokemon("charmander")
      
    // when
    let expectedResult = URL(string: "https://pokeapi.co/api/v2/pokemon/charmander")!
    
    // then
    XCTAssertEqual(sut.url, expectedResult)
  }
}
