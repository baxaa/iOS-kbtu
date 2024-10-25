// Problem 1: FizzBuzz
for number in 1...100 {
    if number % 3 == 0 && number % 5 == 0 {
        print("FizzBuzz")
    } else if number % 3 == 0 {
        print("Fizz")
    } else if number % 5 == 0 {
        print("Buzz")
    } else {
        print(number)
    }
}

// Problem 2: Prime Numbers
func isPrime(_ number: Int) -> Bool {
    if number <= 1 { return false }
    for i in 2..<number {
        if number % i == 0 { return false }
    }
    return true
}

for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}

// Problem 3: Temperature Converter

func convertTemperature(_ value: Double, from unit: String) -> (Double, Double) {
    switch unit.uppercased() {
    case "C":
        return (value * 9/5 + 32, value + 273.15)
    case "F":
        return ((value - 32) * 5/9, (value - 32) * 5/9 + 273.15)
    case "K":
        return (value - 273.15, (value - 273.15) * 9/5 + 32)
    default:
        return (0, 0)
    }
}

print("Enter temperature value:")
if let inputValue = readLine(), let value = Double(inputValue) {
    print("Enter unit (C/F/K):")
    if let unit = readLine() {
        let results = convertTemperature(value, from: unit)
        print("Converted temperatures: \(results.0) and \(results.1)")
    }
}

// Problem 4: Shopping List Manager
import Foundation

var shoppingList = [String]()

while true {
    print("""
    1. Add item
    2. Remove item
    3. View list
    4. Exit
    """)
    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            print("Enter item to add:")
            if let item = readLine() {
                shoppingList.append(item)
            }
        case 2:
            print("Enter item to remove:")
            if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                shoppingList.remove(at: index)
            }
        case 3:
            print("Shopping List: \(shoppingList)")
        case 4:
            print("Shopping List: \(shoppingList)")
            exit(0)
        default:
            print("Invalid choice")
        }
    }
}


// Problem 5: Word Frequency Counter
var wordFrequency = [String: Int]()

print("Enter a sentence:")
if let sentence = readLine() {
    let words = sentence.lowercased().components(separatedBy: CharacterSet.punctuationCharacters.union(.whitespaces))
    for word in words where !word.isEmpty {
        wordFrequency[word, default: 0] += 1
    }
    
    for (word, count) in wordFrequency {
        print("\(word): \(count)")
    }
}

// Problem 6: Fibonacci Sequence
func fibonacci(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

print(fibonacci(1))

// Problem 7: Grade Calculator
var studentScores = ["Alice": 85, "Bob": 90, "Charlie": 78]

func calculateAverage(_ scores: [Int]) -> Double {
    return Double(scores.reduce(0, +)) / Double(scores.count)
}

let scores = Array(studentScores.values)
let average = calculateAverage(scores)
let highestScore = scores.max()!
let lowestScore = scores.min()!

print("Average: \(average), Highest: \(highestScore), Lowest: \(lowestScore)")

for (student, score) in studentScores {
    let status = score > Int(average) ? "above" : "below"
    print("\(student)'s score is \(score), which is \(status) the average.")
}

// Problem 8: Palindrome Checker
func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().filter { $0.isLetter }
    return cleanedText == String(cleanedText.reversed())
}

print(isPalindrome("A man, a plan, a canal, Panama")) // Example call

// Problem 9: Simple Calculator
func add(_ a: Double, _ b: Double) -> Double { a + b }
func subtract(_ a: Double, _ b: Double) -> Double { a - b }
func multiply(_ a: Double, _ b: Double) -> Double { a * b }
func divide(_ a: Double, _ b: Double) -> Double? { b == 0 ? nil : a / b }

while true {
    print("Enter first number:")
    if let firstInput = readLine(), let a = Double(firstInput) {
        print("Enter second number:")
        if let secondInput = readLine(), let b = Double(secondInput) {
            print("Choose operation (+, -, *, /):")
            if let operation = readLine() {
                switch operation {
                case "+":
                    print("Result: \(add(a, b))")
                case "-":
                    print("Result: \(subtract(a, b))")
                case "*":
                    print("Result: \(multiply(a, b))")
                case "/":
                    if let result = divide(a, b) {
                        print("Result: \(result)")
                    } else {
                        print("Error: Division by zero")
                    }
                default:
                    print("Invalid operation")
                }
            }
        }
    }
}

// Problem 10: Unique Characters
func hasUniqueCharacters(_ text: String) -> Bool {
    var characterSet = Set<Character>()
    for char in text {
        if characterSet.contains(char) {
            return false
        }
        characterSet.insert(char)
    }
    return true
}


