import Foundation

extension Endpoint {
  static func pokemon(_ name: String) -> Endpoint {
    Endpoint(path: "pokemon/\(name)")
  }
}
