import UIKit

protocol MenuProtocol {
  var price: Double { get }
  var name: String { get }
}

struct Pizza: MenuProtocol {
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
  var name: String { pizzaType.rawValue + "pizza" }
  let doughWidth: String
}

struct Potato: MenuProtocol {
  enum PotatoType: String {
    case fris
    case rustic
    case mash
  }
  
  let potatoType: PotatoType
  var name: String { "potato " + potatoType.rawValue }
  let price: Double
  let size: String
}

let pizzaOne = Pizza(price: 20, pizzaType: .peperoni, toppingsType: [.olives, .onion], doughWidth: "wide")
let pizzaTwo = Pizza(price: 40, pizzaType: .carbonara, toppingsType: [.parmezan, .schreems], doughWidth: "thing")

let potatoOne = Potato(potatoType: .fris, price: 10, size: "Large")
let potatoTwo = Potato(potatoType: .rustic, price: 15, size: "Medium")

// 1. В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.

class PizzaRestaurant {
  var menu: [MenuProtocol]
  
  init(menu: [MenuProtocol]) {
    self.menu = menu
  }
  // 2. Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню
  func order(_ new: MenuProtocol) {
    menu.append(new)
  }
}

let pizzaResOne = PizzaRestaurant(menu: [])
pizzaResOne.order(potatoOne)
pizzaResOne.order(pizzaOne)
print(pizzaResOne)

// 3. Создайте протокол, в котором будут содержаться функции открытия и закрытия
protocol WorkingStatus {
  func open()
  func closes()
}

// 4. Написать расширение для класса пиццерии, в  котором будет реализован протокол из пункта 3
extension PizzaRestaurant: WorkingStatus {
  func open() {
    print("Our pizza is opened for you, welcome")
  }
  
  func closes() {
    print("Sorry we are closed now, but we waiting for you later")
  }
}

// 5.  Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания
func subtract(_ numberOne: Double, _ numberTwo: Double) -> Double {
  return numberOne - numberTwo
}

func subtract(_ numberOne: Int, _ numberTwo: Int) -> Int {
   numberOne - numberTwo
}

let resultOne = subtract(4, 7)
print(resultOne)

let resultTwo = subtract(6, 4)
print(resultTwo)
