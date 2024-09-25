import Foundation
/*
protocol CountriesRepositoryProtocol {
    func fetchCountries() async throws -> [Country]
}*/

class CountriesRepository: CountriesRepositoryProtocol {
    
    private let networkService: NetworkServiceProtocol
        
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCountries() async throws -> [Country] {
        let countryDTOs =  try await networkService.fetch(endpoint: Endpoint<[CountryDTO]>.countries)
        return countryDTOs.map { $0.toDomain }
    }
}
