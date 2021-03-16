//
//  ModelFood.swift
//  Comida
//
//  Created by Jose Martin Salcedo on 15/03/21.
//

import Foundation

struct Meals: Decodable {
  let meals: [Food]
  
  enum CodingKeys: String, CodingKey {
    case meals
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.meals = try container.decode([Food].self, forKey: .meals)
  }
}

struct Food: Decodable {
  let dateModified: String?
  let idMeal: Int?
  let strArea: String?
  let strCategory: String?
  let strCreativeCommonsConfirmed : String?
  let strDrinkAlternate : String?
  let strImageSource : String?
  let strIngredient1 : String?
  let strIngredient10: String?
  let strIngredient11: String?
  let strIngredient12: String?
  let strIngredient13 : String?
  let strIngredient14 : String?
  let strIngredient15 : String?
  let strIngredient16 : String?
  let strIngredient17 : String?
  let strIngredient18 : String?
  let strIngredient19 : String?
  let strIngredient2 : String?
  let strIngredient20 : String?
  let strIngredient3: String?
  let strIngredient4: String?
  let strIngredient5: String?
  let strIngredient6: String?
  let strIngredient7: String?
  let strIngredient8: String?
  let strIngredient9: String?
  let strInstructions: String?
  let strMeal: String?
  let strMealThumb: String?
  let strMeasure1: String?
  let strMeasure10: String?
  let strMeasure11: Int?
  let strMeasure12: String?
  let strMeasure13 : String?
  let strMeasure14 : String?
  let strMeasure15 : String?
  let strMeasure16 : String?
  let strMeasure17 : String?
  let strMeasure18 : String?
  let strMeasure19 : String?
  let strMeasure2: String?
  let strMeasure20 : String?
  let strMeasure3: String?
  let strMeasure4: String?
  let strMeasure5: String?
  let strMeasure6: String?
  let strMeasure7: String?
  let strMeasure8: String?
  let strMeasure9: String?
  let strSource: String?
  let strTags: String?
  let strYoutube: String?
  
  enum CodingKeys: String, CodingKey {
    case dateModified
    case idMeal
    case strArea
    case strCategory
    case strCreativeCommonsConfirmed
    case strDrinkAlternate
    case strImageSource
    case strIngredient1
    case strIngredient10
    case strIngredient11
    case strIngredient12
    case strIngredient13
    case strIngredient14
    case strIngredient15
    case strIngredient16
    case strIngredient17
    case strIngredient18
    case strIngredient19
    case strIngredient2
    case strIngredient20
    case strIngredient3
    case strIngredient4
    case strIngredient5
    case strIngredient6
    case strIngredient7
    case strIngredient8
    case strIngredient9
    case strInstructions
    case strMeal
    case strMealThumb
    case strMeasure1
    case strMeasure10
    case strMeasure11
    case strMeasure12
    case strMeasure13
    case strMeasure14
    case strMeasure15
    case strMeasure16
    case strMeasure17
    case strMeasure18
    case strMeasure19
    case strMeasure2
    case strMeasure20
    case strMeasure3
    case strMeasure4
    case strMeasure5
    case strMeasure6
    case strMeasure7
    case strMeasure8
    case strMeasure9
    case strSource
    case strTags
    case strYoutube
  }
  
//  public init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    self.dateModified = try container.decode(String.self, forKey: .dateModified)
//    self.idMeal = try container.decode(Int.self, forKey: .idMeal)
//    self.strArea = try container.decode(String.self, forKey: .strArea)
//    self.strCategory = try container.decode(String.self, forKey: .strCategory)
//  }
}
