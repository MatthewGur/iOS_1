enum Weekday: Int {
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
}

enum Planet: String {
    case mercury = "Меркурий", venus = "Венера", earth = "Земля", mars = "Марс"
}

print("1. Примеры enum с разными RawValue:")
print("Понедельник - \(Weekday.monday.rawValue)")
print("3-я планета - \(Planet.earth.rawValue)")

enum Gender: String {
    case male = "Мужской"
    case female = "Женский"
    case other = "Другой"
}

enum AgeCategory: String {
    case young = "18-30 лет"
    case adult = "31-45 лет"
    case elderly = "46-60 лет"
}

enum Experience: String {
    case junior = "До 3 лет"
    case middle = "3-7 лет"
    case senior = "Более 7 лет"
}

struct EmployeeProfile {
    var name: String
    var gender: Gender
    var ageCategory: AgeCategory
    var experience: Experience
}

print("\n2. Пример анкеты сотрудника:")
let employee = EmployeeProfile(
    name: "Иван Иванов",
    gender: .male,
    ageCategory: .adult,
    experience: .senior
)

print("Сотрудник: \(employee.name)")
print("Пол: \(employee.gender.rawValue)")
print("Возрастная категория: \(employee.ageCategory.rawValue)")
print("Стаж: \(employee.experience.rawValue)")

enum RainbowColor: String, CaseIterable {
    case red = "Красный"
    case orange = "Оранжевый"
    case yellow = "Желтый"
    case green = "Зеленый"
    case light_blue = "Голубой"
    case blue = "Синий"
    case violet = "Фиолетовый"
}

print("\n3. Цвета радуги:")
for color in RainbowColor.allCases {
    print(color.rawValue)
}

func printColorAssociations() {
    let associations: [(item: String, color: RainbowColor)] = [
        ("яблоко", .green),
        ("солнце", .red),
        ("небо", .blue),
        ("банан", .yellow),
        ("апельсин", .orange)
    ]
    
    for association in associations {
        print("\(association.item) \(association.color.rawValue.lowercased())")
    }
}

print("\n4. Ассоциации цветов:")
printColorAssociations()

enum Score: String {
    case excellent = "Отлично"
    case good = "Хорошо"
    case satisfactory = "Удовлетворительно"
    case poor = "Неудовлетворительно"
    
    var numericValue: Int {
        switch self {
        case .excellent: return 5
        case .good: return 4
        case .satisfactory: return 3
        case .poor: return 2
        }
    }
}

func printScoreValue(score: Score) {
    print("Оценка '\(score.rawValue)' соответствует числу \(score.numericValue)")
}

print("\n5. Примеры оценок:")
printScoreValue(score: .excellent)
printScoreValue(score: .satisfactory)

enum CarBrand: String {
    case bmw = "BMW"
    case audi = "Audi"
    case mercedes = "Mercedes"
    case toyota = "Toyota"
    case honda = "Honda"
}

func printCarsInGarage(cars: [CarBrand]) {
    if cars.isEmpty {
        print("Гараж пуст")
    } else {
        print("В гараже находятся следующие автомобили:")
        for car in cars {
            print("- \(car.rawValue)")
        }
    }
}

print("\n6. Содержимое гаража:")
let myCars: [CarBrand] = [.bmw, .audi, .toyota]
printCarsInGarage(cars: myCars)
