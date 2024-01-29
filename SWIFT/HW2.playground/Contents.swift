import UIKit

/*
 
 1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.
 */
func culculateDeposit(amount: Double, interest: Double, days: Double) -> Double {

  let percent = (amount * interest * 366 / days) / 100
  let totalAmount = amount + percent
  
  return totalAmount
}

let finalAmount = culculateDeposit(amount: 100_000, interest: 10, days: 367)
print("Your final deposit is \(finalAmount)")
/*
 1. Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.
 */
enum PizzaKind: String {
  case margaritta = "Margarita Pizza"
  case peperoni = "Peperoni Pizza"
  case fourChees = "Four chees Pizza"
}

var firstPizza: PizzaKind = .margaritta
var secondPizza: PizzaKind = .peperoni
var thirdPizza = PizzaKind.fourChees

/*
 2. Добавить возможность получения названия пиццы через rawValue
 */

var fourPizza = PizzaKind(rawValue: "Margarita Pizza")
var fivePizza = PizzaKind.peperoni.rawValue
var sixPizza = PizzaKind.fourChees.rawValue


