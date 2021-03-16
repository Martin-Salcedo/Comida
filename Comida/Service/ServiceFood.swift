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
  
  func getListFood(textSearch: String) {
    let url = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(textSearch)"
    let kStatusOk = 200...299
    AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: Meals.self) {
      response in
      if let food = response.value?.meals {
        print(food)
      } else {
        print(response.error?.responseCode)
      }
    }
  }
}
