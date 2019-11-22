import Foundation

extension Endpoint {
  static func pokemon(name: String) -> Endpoint {
    Endpoint(path: "pokemon/\(name)")
  }
  
  static func pokemon(id: Int) -> Endpoint {
    Endpoint(path: "pokemon/\(id)")
  }
}
