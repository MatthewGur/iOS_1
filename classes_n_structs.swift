import Foundation

class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Животное издает звук")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("\(name) гавкает")
    }
    
    func fetch() {
        print("\(name) принес палку")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("\(name) мяукает")
    }
    
    func climbTree() {
        print("\(name) залез на дерево")
    }
}

// Пример использования
let myDog = Dog(name: "Бобик")
myDog.makeSound() // Бобик гавкает
myDog.fetch()

let myCat = Cat(name: "Мурзик")
myCat.makeSound() // Мурзик мяукает
myCat.climbTree()

class House {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func create() {
        let area = width * height
        print("Дом создан. Площадь: \(area) кв.м")
    }
    
    func destroy() {
        print("Дом \(width)x\(height) уничтожен!")
    }
}

// Пример использования
let myHouse = House(width: 10.5, height: 8.2)
myHouse.create() // Дом создан. Площадь: 86.1 кв.м
myHouse.destroy() // Дом 10.5x8.2 уничтожен!

struct Student {
    var name: String
    var age: Int
    var grade: Double
}

class StudentSorter {
    func sortByName(_ students: [Student]) -> [Student] {
        return students.sorted { $0.name < $1.name }
    }
    
    func sortByAge(_ students: [Student]) -> [Student] {
        return students.sorted { $0.age < $1.age }
    }
    
    func sortByGrade(_ students: [Student]) -> [Student] {
        return students.sorted { $0.grade > $1.grade }
    }
}

// Пример использования
let students = [
    Student(name: "Анна", age: 20, grade: 4.5),
    Student(name: "Иван", age: 22, grade: 3.8),
    Student(name: "Мария", age: 19, grade: 4.9)
]

let sorter = StudentSorter()
print(sorter.sortByName(students))
print(sorter.sortByAge(students))
print(sorter.sortByGrade(students))

// Класс - ссылочный тип
class CarClass {
    var brand: String
    var year: Int
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }
}

// Структура - тип значений
struct CarStruct {
    var brand: String
    var year: Int
}

/*
 Различия между структурами и классами:
 1. Структуры - value types (типы значений), классы - reference types (ссылочные типы)
 2. Структуры копируются при присваивании, классы передаются по ссылке
 3. Структуры не поддерживают наследование
 4. Для классов можно использовать деинициализаторы
 5. Классы позволяют изменять свойства даже у констант (let)
 
 В Swift рекомендуется использовать структуры по умолчанию,
 а классы только когда нужна именно их семантика.
*/


enum Suit: String, CaseIterable {
    case hearts = "червей"
    case diamonds = "бубен"
    case clubs = "треф"
    case spades = "пик"
}

enum Rank: Int, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace
}

struct Card {
    let suit: Suit
    let rank: Rank
}

class PokerGame {
    private var deck: [Card] = []
    private var hand: [Card] = []
    
    init() {
        createDeck()
    }
    
    private func createDeck() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                deck.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func dealHand() {
        deck.shuffle()
        hand = Array(deck.prefix(5))
        print("Ваши карты:")
        for card in hand {
            print("\(card.rank) \(card.suit.rawValue)")
        }
        checkCombinations()
    }
    
    private func checkCombinations() {
        let combinations = [
            checkRoyalFlush(),
            checkStraightFlush(),
            checkFourOfAKind(),
            checkFullHouse(),
            checkFlush(),
            checkStraight(),
            checkThreeOfAKind(),
            checkTwoPairs(),
            checkPair()
        ]
        
        if let combination = combinations.compactMap({ $0 }).first {
            print("\nУ вас \(combination)!")
        } else {
            print("\nУ вас старшая карта")
        }
    }
    
    // Проверка комбинаций
    private func checkRoyalFlush() -> String? {
        let royalRanks: Set<Rank> = [.ten, .jack, .queen, .king, .ace]
        let suits = hand.map { $0.suit }
        
        if Set(suits).count == 1 && Set(hand.map { $0.rank }).isSubset(of: royalRanks) {
            return "роял флеш \(suits[0].rawValue)"
        }
        return nil
    }
    
    private func checkStraightFlush() -> String? {
        if checkFlush() != nil && checkStraight() != nil {
            return "стрит флеш \(hand[0].suit.rawValue)"
        }
        return nil
    }
    
    private func checkFourOfAKind() -> String? {
        let ranks = hand.map { $0.rank }
        for rank in ranks {
            if ranks.filter { $0 == rank }.count == 4 {
                return "каре \(rank)"
            }
        }
        return nil
    }
    
    private func checkFullHouse() -> String? {
        let ranks = hand.map { $0.rank }
        let uniqueRanks = Set(ranks)
        
        if uniqueRanks.count == 2 {
            let count1 = ranks.filter { $0 == uniqueRanks.first! }.count
            if count1 == 2 || count1 == 3 {
                return "фулл хаус"
            }
        }
        return nil
    }
    
    private func checkFlush() -> String? {
        let suits = hand.map { $0.suit }
        if Set(suits).count == 1 {
            return "флеш \(suits[0].rawValue)"
        }
        return nil
    }
    
    private func checkStraight() -> String? {
        let sortedRanks = hand.map { $0.rank.rawValue }.sorted()
        let isStraight = sortedRanks == Array(sortedRanks[0]...sortedRanks[0]+4) ||
            sortedRanks == [2, 3, 4, 5, 14] // младший стрит (A-2-3-4-5)
        
        return isStraight ? "стрит" : nil
    }
    
    private func checkThreeOfAKind() -> String? {
        let ranks = hand.map { $0.rank }
        for rank in ranks {
            if ranks.filter { $0 == rank }.count == 3 {
                return "сет \(rank)"
            }
        }
        return nil
    }
    
    private func checkTwoPairs() -> String? {
        let ranks = hand.map { $0.rank }
        let uniqueRanks = Set(ranks)
        var pairCount = 0
        
        for rank in uniqueRanks {
            if ranks.filter { $0 == rank }.count == 2 {
                pairCount += 1
            }
        }
        
        return pairCount == 2 ? "две пары" : nil
    }
    
    private func checkPair() -> String? {
        let ranks = hand.map { $0.rank }
        for rank in ranks {
            if ranks.filter { $0 == rank }.count == 2 {
                return "пара \(rank)"
            }
        }
        return nil
    }
}

// Вызов
let pokerGame = PokerGame()
pokerGame.dealHand()
