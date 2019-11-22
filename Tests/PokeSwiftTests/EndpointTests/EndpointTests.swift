import XCTest
@testable import PokeSwift

final class EndpointTests: XCTestCase {
  
  func test_EndPointPath() {
    // given
    let sut = Endpoint(path: "test")
    
    // then
    XCTAssertEqual(sut.modifiedPath, "/api/v2/test")
  }
  
  func test_pokemon_url_withName() {
    // given
    let sut = Endpoint.pokemon(name: "charmander")
      
    // when
    let expectedResult = URL(string: "https://pokeapi.co/api/v2/pokemon/charmander")!
    
    // then
    XCTAssertEqual(sut.url, expectedResult)
  }
  
  func test_pokemon_url_withID() {
    // given
    let sut = Endpoint.pokemon(id: 1)
    
    // when
    let expectedResult = URL(string: "https://pokeapi.co/api/v2/pokemon/1")!
    
    // then
    XCTAssertEqual(sut.url, expectedResult)
  }
}
