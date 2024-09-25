import Foundation

extension Endpoint {
    static var countries: Endpoint<[CountryDTO]> {
        Endpoint<[CountryDTO]>(path: "v3.1/all", queryItems: [])
    }
}
