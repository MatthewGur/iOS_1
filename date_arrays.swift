import Foundation

let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

let monthNames = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", 
                 "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]

print("Количество дней в каждом месяце:")
for days in daysInMonths {
    print(days)
}

print("\nНазвание месяца и количество дней:")
for i in 0..<monthNames.count {
    print("\(monthNames[i]): \(daysInMonths[i]) дней")
}

let monthsData = [
    ("Январь", 31),
    ("Февраль", 28),
    ("Март", 31),
    ("Апрель", 30),
    ("Май", 31),
    ("Июнь", 30),
    ("Июль", 31),
    ("Август", 31),
    ("Сентябрь", 30),
    ("Октябрь", 31),
    ("Ноябрь", 30),
    ("Декабрь", 31)
]

print("\nКортежи:")
for (month, days) in monthsData {
    print("\(month): \(days) дней")
}

print("\nДни в обратном порядке:")
for days in daysInMonths.reversed() {
    print(days)
}

let randomMonth = Int.random(in: 1...12) // Случайный месяц (1-12)
let maxDay = daysInMonths[randomMonth-1] // Максимальное число дней в выбранном месяце
let randomDay = Int.random(in: 1...maxDay) // Случайный день в этом месяце

print("\nСлучайная дата: \(randomDay) \(monthNames[randomMonth-1])")

var totalDays = 0
for i in 0..<randomMonth-1 {
    totalDays += daysInMonths[i]
}
totalDays += randomDay

print("От начала года до \(randomDay) \(monthNames[randomMonth-1]) прошло \(totalDays) дней")
