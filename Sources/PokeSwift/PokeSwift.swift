import Foundation

struct PokeSwift {
  static func pokemon(name: String) {
    let apiClient = APIClient<Pokemon>()
    let endpoint = Endpoint.pokemon(name: name)

   apiClient.request(endpoint) { result in
      switch result {
      case .success(let data):
        print(data)
      case .failure(let error):
        print(error)
      }
    }
  }
}
