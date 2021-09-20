//
//  ModelFood.swift
//  Comida
//
//  Created by Jose Martin Salcedo on 15/03/21.
//

import Foundation

struct Meals: Decodable {
  let meals: [Food]
}

struct Food: Decodable {
  let dateModified: String?
  let idMeal: String?
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
  let strMeasure11: String?
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
}

struct Airplane {
    let manufacturer: String
    let model: String
    
//    var computedProperty: String {
//        get {
////            code
//        }
//
//        set {
////            code
//        }
//    }
}

//example computed property
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    
    var area: Double {
        return size.width * size.height
    }
}
