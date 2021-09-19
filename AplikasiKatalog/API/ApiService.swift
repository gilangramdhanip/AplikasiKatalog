//
//  network.swift
//  AplikasiKatalog
//
//  Created by Gilang Ramdhani Putra on 12/09/21.
//

import Foundation
import UIKit


class ApiService {
    private var dataTask : URLSessionDataTask?
    
    func getData(completion : @escaping ([Game]) -> Void){
        
        let dataGameUrl = "https://api.rawg.io/api/games?key=1104fbec0dbd4792b46f31695e71aa02"
        
        guard let url = URL(string: dataGameUrl) else {return }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
//                completion(.failure(error))
                print("DataTask Error : \(error.localizedDescription)")
                
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                
                return
            }
            
            print("Response status code : \(response.statusCode)")
            
            guard let data = data else {
                
                print("Empty Data")
                return
            }
            
            do {
                let decode = JSONDecoder()
                let jsonData = try decode.decode(GameData.self, from: data)
                
                completion(jsonData.game)
                
//                DispatchQueue.main.async {
//                    completion(.success(jsonData))
//                }
            } catch {
//                completion(.failure(error))
            }
            
            
        }
        dataTask?.resume()
        
    }
}


