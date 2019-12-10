import Foundation

struct Pokemon: Decodable {
  let abilities: [AbilityContainer]
  let baseExperience: Int
  let forms: [Form]
  let gameIndices: [GameIndice]
  let height: Int
  let heldItems: [HeldItem]
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

// MARK: Game Indices

extension Pokemon {
  struct GameIndice: Decodable {
    let gameIndex: Int
    let version: Version

    struct Version: Decodable {
      let name: String
      let url: String
    }
  }
}

// MARK: Held Items

extension Pokemon {
  struct HeldItem: Decodable {
    let item: Item
    let versionDetails: [VersionDetail]

    struct Item: Decodable {
      let name: String
      let url: String
    }

    struct VersionDetail: Decodable {
      let rarity: Int
      let version: Version

      struct Version: Decodable {
        let name: String
        let url: String
      }
    }
  }
}


