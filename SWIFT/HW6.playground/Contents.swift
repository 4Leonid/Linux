import UIKit

// 1. Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар. Добавить в класс пиццерии массив с работниками

struct Worker {
  let name: String
  let salary: Double
  let position: String
}

protocol MenuProtocol {
  var price: Double { get }
  var name: String { get }
}

// 2. Создать класс столика, в нем должны быть свойство, в котором содержится количество мест и функция, которая на вход принимает количество гостей, которое хотят посадить, а возвращает true, если места хватает и false, если места не хватает. Изначальное количество мест задается в инициализаторе

class Table {
  let places: Int
  let guests: Int
  weak var pizza: PizzaRestaurant?
  
  init(places: Int, guests: Int, pizza: PizzaRestaurant) {
    self.places = places
    self.guests = guests
    self.pizza = pizza
  }
  
  func isEnouth() -> Bool {
    guests < places
  }
}
// 3. Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра

class PizzaRestaurant {
  var menu: [MenuProtocol]
  var workers: [Worker]
  var tables: [Table]
  
  init(menu: [MenuProtocol], workers: [Worker], tables: [Table]) {
    self.menu = menu
    self.workers = workers
    self.tables = tables
  }
  
  func order(_ new: MenuProtocol) {
    menu.append(new)
  }
}


