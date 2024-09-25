import Foundation

struct CountryDTO: Decodable {
    struct NameDTO: Decodable {
        let common: String
    }
    let name: NameDTO
}

extension CountryDTO {
    var toDomain: Country {
        Country(name: name.common)
    }
}
