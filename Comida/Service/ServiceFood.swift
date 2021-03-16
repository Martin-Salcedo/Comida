//
//  ServiceFood.swift
//  Comida
//
//  Created by Jose Martin Salcedo on 15/03/21.
//

import Foundation
import Alamofire

class ServiceFood {
  
  static func getListFood() {
    
//    func fetchFilms() {
        // 1
//        let request = AF.request("https://swapi.dev/api/films")
//        // 2
//        request.responseJSON { (data) in
//          print(data)
//        }
//      }
    
//    AF.request("https://www.themealdb.com/api/json/v1/1/search.php?s=taco")
//
//    AF.request(.POST, "https://www.themealdb.com/api/json/v1/1/search.php?s=taco", parameters:parameters, encoding: .JSON) .responseJSON {
//        (request, response, data, error) in
//
//    var json = JSON(data: data!)
//
//           println(json)
//           println(json["productList"][1])
//
//    }
    AF.request("https://www.themealdb.com/api/json/v1/1/search.php?s=taco").responseJSON { response in
      switch response.result {
      case .success(_):
        print(response)
        do {
          let users = try JSONDecoder().decode(Meals.self, from: response.data!)
          print(users)
        } catch let error as NSError {
          print("Failed to load: \(error.localizedDescription)")
        }
      case .failure(let error):
        print("error\(error.localizedDescription)")
      }
    }
  }
}
