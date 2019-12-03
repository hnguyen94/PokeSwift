import Foundation

struct Pokemon: Decodable {
  let id: Int
  let name: String
  let height: Int
  let order: Int
  let weight: Int
}
