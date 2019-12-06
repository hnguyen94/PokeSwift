import Foundation

struct Pokemon: Decodable {
  let baseExperience: Int
  let height: Int
  let id: Int
  let isDefault: Bool
  let locationAreaEncounters: String
  let name: String
  let order: Int
  let weight: Int
}
