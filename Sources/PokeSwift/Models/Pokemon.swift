import Foundation

struct Pokemon: Decodable {
  let abilities: [AbilityContainer]
  let baseExperience: Int
  let forms: [Form]
  let height: Int
  let id: Int
  let isDefault: Bool
  let locationAreaEncounters: String
  let name: String
  let order: Int
  let weight: Int
}

// MARK: Ability

extension Pokemon {
  struct AbilityContainer: Decodable {
    let ability: Ability
    let isHidden: Bool
    let slot: Int
    
    struct Ability: Decodable {
      let name: String
      let url: String
    }
  }
}

// MARK: Form {

extension Pokemon {
  struct Form: Decodable {
    let name: String
    let url: String
  }
}
