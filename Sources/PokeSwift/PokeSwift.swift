import Foundation

struct PokeSwift {
  static func pokemon(name: String, completion: @escaping (Result<Pokemon, APIClientError>) -> Void) {
    let apiClient = APIClient<Pokemon>()
    let endpoint = Endpoint.pokemon(name: name)

    apiClient.request(endpoint) { completion($0) }
  }
}
