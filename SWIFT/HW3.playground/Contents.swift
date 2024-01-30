import UIKit

/*
 Есть словарь с видами чая и их стоимостью. Есть очередь людей, которые хотят заказать чай (можно представить её в виде массива видов чая, которые хотят заказать).
Необходимо последовательно выводить в консоль сколько заплатит покупатель (необходимо вывести его номер по порядку, чай, который он заказал, и стоимость).
 */
enum Tea {
  case black
  case green
  case white
  case fruit
}

let dictionary: [Tea: Int] = [.black: 10, .green: 15, .white: 20, .fruit: 25]
let arrayOfClients: [Tea] = [.black, .green, .white, .fruit]

for (index, client) in arrayOfClients.enumerated() {
  for (_, value) in dictionary {
    print("For \(index) client \(client) tee cost is \(value) coints")
  }
}
 
/*
 Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. Необходимо создать новый массив, который будет состоять из элементов старого, но не должно быть nil, не должно быть 0 и 4, а также массив должен быть отсортирован по возрастанию.
 */
let arrayOfNumbers = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]

let noNilNumbers = arrayOfNumbers.compactMap { $0 }.filter { $0 != 0 && $0 != 4 }.sorted { $0 < $1 }
print(noNilNumbers)


/*
 Написать функцию, которая на вход принимает целое число, а возвращает массив, который сформирован по следующим правилам: количество элементов соответствует переданному числу, массив начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.
 */

func createArray(with numbers: Int) -> [Int] {
  var numbersArray = [1]
  
  for _ in 1 ..< numbers {
    if let lastNumber = numbersArray.last {
      let nextNumber = lastNumber * 2
      numbersArray.append(nextNumber)
    }
  }
  return numbersArray
}

let newArray = createArray(with: 5)
print(newArray)
