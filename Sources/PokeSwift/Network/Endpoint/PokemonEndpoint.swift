import Foundation

extension Endpoint {
  static func pokemon(name: String) -> Endpoint {
    Endpoint(pathComponent: .pokemon, parameter: name)
  }
  
  static func pokemon(id: Int) -> Endpoint {
    Endpoint(pathComponent: .pokemon, parameter: String(id))
  }
}
