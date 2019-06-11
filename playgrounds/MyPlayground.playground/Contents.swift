import Foundation

let pizzaInInches: Int = 33
var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFeedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFeedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}


var width: Float = 1.5
var height: Float = 2.3

var bucketsOfPaint: Int {
    get {
        let area = width * height
        return Int(ceilf(area/1.5))
    }
    set {
        let maxArea = 1.5 * Double(newValue)
        print("this amount of paint can cover \(maxArea) sqm")
    }
    
}

print(bucketsOfPaint)

bucketsOfPaint = 4
