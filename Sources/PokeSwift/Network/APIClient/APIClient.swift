import Foundation

enum APIClientError: Error {
  case invalidEndpointURL
  case serverError
  case failedDecoding
}

struct APIClient<MODEL: Decodable> {
  func request(
    _ endpoint: Endpoint,
    completionHandler: @escaping (Result<MODEL, APIClientError>) -> Void
  ) {
    guard let url = endpoint.url else {
      completionHandler(.failure(.invalidEndpointURL))
      return
    }
    
    // MARK: - Error Handling
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if error != nil {
        completionHandler(.failure(.serverError))
        return
      }
      
      guard let data = data else {
        completionHandler(.failure(.serverError))
        return
      }
      
      // MARK: - Converting Data
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(MODEL.self, from: data)
        completionHandler(.success(decodedData))
      } catch {
        completionHandler(.failure(.failedDecoding))
      }
    }
    
    task.resume()
  }
}
