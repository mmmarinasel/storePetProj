import Foundation
import UIKit.UIImage

protocol ILoader {
    static func getData(urlString: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
    static func getJson<T: Codable>(urlString: String, completion: @escaping (T) -> Void)
}

protocol IPicturesLoader {
    static func loadImageByUrl(urlString: String, completion: @escaping (UIImage) -> Void)
}

class NetworkManager: ILoader, IPicturesLoader {
    
    static let homeStoreUrl: String = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    static let productDetailsUrl: String = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    static let cartUrl: String = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    static func getData(urlString: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    static func getJson<T: Codable>(urlString: String, completion: @escaping (T) -> Void) {
        NetworkManager.getData(urlString: urlString) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(json)
            } catch {
                print(error.localizedDescription)
                print(error)
            }
        }
    }
    
    static func loadImageByUrl(urlString: String, completion: @escaping (UIImage) -> Void) {
        DispatchQueue.global().async {
            if let url = URL(string: urlString),
               let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
}
