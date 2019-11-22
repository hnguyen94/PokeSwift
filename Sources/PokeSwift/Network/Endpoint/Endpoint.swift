import Foundation

struct Endpoint {
  let path: String
  var modifiedPath: String { "/api/v2/\(path)".lowercased() }
}

extension Endpoint {
  var url: URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "pokeapi.co"
    components.path = modifiedPath
    return components.url
  }
}
