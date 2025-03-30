import Foundation

let numbers = [12, 5, 8, 3, 17, 10]

let sortedAscending = numbers.sorted { $0 < $1 }
print("Сортировка по возрастанию: \(sortedAscending)")

let sortedDescending = numbers.sorted { $0 > $1 }
print("Сортировка по убыванию: \(sortedDescending)")

func addFriendsNames(names: String...) -> [String] {
    var friendsArray = [String]()
    for name in names {
        friendsArray.append(name)
    }
    return friendsArray
}

let friends = addFriendsNames(names: "Александр", "Мария", "Дмитрий", "Яна", "Иван")
print("\nИсходный массив друзей: \(friends)")

let sortedByLength = friends.sorted { $0.count < $1.count }
print("Отсортировано по длине имен: \(sortedByLength)")

var friendsDictionary = [Int: String]()
for name in friends {
    friendsDictionary[name.count] = name
}
print("\nСловарь друзей: \(friendsDictionary)")

func printValue(forKey key: Int) {
    if let value = friendsDictionary[key] {
        print("Для ключа \(key) найдено имя: \(value)")
    } else {
        print("Для ключа \(key) нет значения")
    }
}

print("\nПоиск по ключу:")
printValue(forKey: 4)
printValue(forKey: 145)

func checkArrays(stringArray: [String], numberArray: [Int]) {
    var modifiedStringArray = stringArray
    var modifiedNumberArray = numberArray
    
    if stringArray.isEmpty {
        modifiedStringArray.append("Новое значение")
        print("\nДобавлено значение в пустой строковый массив: \(modifiedStringArray)")
    }
    
    if numberArray.isEmpty {
        modifiedNumberArray.append(10)
        print("Добавлено значение в пустой числовой массив: \(modifiedNumberArray)")
    }
    
    if !stringArray.isEmpty && !numberArray.isEmpty {
        print("\nОба массива не пустые")
        print("Строковый массив: \(stringArray)")
        print("Числовой массив: \(numberArray)")
    }
}

print("\nПроверка массивов:")

checkArrays(stringArray: ["New", "Next"], numberArray: [1, 2, 3])

checkArrays(stringArray: [], numberArray: [])
