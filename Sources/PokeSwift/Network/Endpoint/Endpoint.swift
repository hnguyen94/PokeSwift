import Foundation

struct Endpoint {
  static let separator = "/"
  
  /// Returns "/api/v2/"
  static var rootPath: String {
    let rootPathComponents: [Router] = [.api, .version]
    let mergedComponents = rootPathComponents
      .map { $0.rawValue }
      .joined(separator: Self.separator)

    return Self.separator + mergedComponents + Self.separator
  }

  let pathComponent: Router.PathComponents
  let parameter: String

  var finalPath: String {
    let joinedPath = [pathComponent.rawValue, parameter].joined(separator: Self.separator)
    return Self.rootPath + joinedPath
  }

  init(pathComponent: Router.PathComponents, parameter: String) {
    self.pathComponent = pathComponent
    let modifiedParameter = parameter
      .lowercased()
      .replacingOccurrences(of: Self.separator, with: "")
    self.parameter = modifiedParameter
  }
}

// MARK: Route

extension Endpoint {
  enum Router: String {
    case api
    case version = "v2"

    enum PathComponents: String {
      case pokemon
    }
  }
}


extension Endpoint {
  var url: URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "pokeapi.co"
    components.path = finalPath
    return components.url
  }
}
