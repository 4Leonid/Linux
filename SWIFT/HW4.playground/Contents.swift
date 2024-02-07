import UIKit

// Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)



// Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.

struct Pizza {
  enum PizzaType: String {
    case peperoni
    case margarita
    case carbonara
    case capriccioza
  }
  
  enum ToppingsType: String {
    case onion
    case schreems
    case olives
    case parmezan
  }
  
  let price: Double
  let pizzaType: PizzaType
  let toppingsType: [ToppingsType]
  var pizzaName: String { pizzaType.rawValue + "pizza" }
  let doughWidth: String
}

// Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.

class PizzaRestaurant {
  private var pizzaList: [Pizza]
  
  init(pizzaList: [Pizza]) {
    self.pizzaList = pizzaList
  }
  // Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.
  func add(newPizza: Pizza) {
    pizzaList.append(newPizza)
  }
  
  func getAllPizza() -> [Pizza] {
    pizzaList
  }
}


let pizzaOne = Pizza(price: 20, pizzaType: .peperoni, toppingsType: [.olives, .onion], doughWidth: "wide")
let pizzaTwo = Pizza(price: 40, pizzaType: .carbonara, toppingsType: [.parmezan, .schreems], doughWidth: "thing")
let pizzaThree = Pizza(price: 60, pizzaType: .capriccioza, toppingsType: [.schreems, .parmezan, .onion, .olives], doughWidth: "thing")

//  Создать экземпляр класса пиццерии и добавить в него несколько пицц.
let firstPizzaRestaurant = PizzaRestaurant(pizzaList: [])
firstPizzaRestaurant.add(newPizza: pizzaOne)
firstPizzaRestaurant.add(newPizza: pizzaOne)
firstPizzaRestaurant.add(newPizza: pizzaTwo)
firstPizzaRestaurant.add(newPizza: pizzaThree)


let allPizza = firstPizzaRestaurant.getAllPizza()
print(allPizza)
