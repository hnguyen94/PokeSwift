import Foundation

enum APIClientError: Error {
  case invalidEndpointURL
  case serverError
  case failedDecoding
}

struct APIClient<Model: Decodable> {
  func request(
    _ endpoint: Endpoint,
    completionHandler: @escaping (Result<Model, APIClientError>) -> Void
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
        let decodedData = try decoder.decode(Model.self, from: data)
        completionHandler(.success(decodedData))
      } catch {
        completionHandler(.failure(.failedDecoding))
      }
    }
    
    task.resume()
  }
}
