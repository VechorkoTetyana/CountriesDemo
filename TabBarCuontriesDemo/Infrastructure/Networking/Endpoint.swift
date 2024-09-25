import Foundation

struct Endpoint<T> {
    let path: String
    let queryItems: [URLQueryItem]
    let headers: [String: String]?
    
    init(
        path: String,
        queryItems: [URLQueryItem],
        headers: [String : String]? = nil
    ) {
        self.path = path
        self.queryItems = queryItems
        self.headers = headers
    }
}
