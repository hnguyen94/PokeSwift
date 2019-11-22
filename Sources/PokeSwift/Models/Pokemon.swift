import Foundation

struct Pokemon: Decodable {
  let id: String
  let name: String
  let height: Int
  let order: Int
  let weight: Int
}
