//
//  ServiceFood.swift
//  Comida
//
//  Created by Jose Martin Salcedo on 15/03/21.
//

import Foundation
import Alamofire

class ServiceFoodProvider {
  
  static let shared = ServiceFoodProvider()
  
  func getListFood() {
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
