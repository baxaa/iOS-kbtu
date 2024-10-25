import Foundation
//Easy Tasks
//1. Array Crea4on and Access:
let fruits = ["Apple", "Banana", "Orange", "Grapes", "Peach"]

print(fruits[2])

//2. Set Crea4on and Manipula4on:
var favoriteNumbers: Set<Int> = [7, 14, 21]

favoriteNumbers.insert(28)

print(favoriteNumbers)

// Task 3: Create a dictionary with programming languages and release years
let programmingLanguages = ["Swift": 2014, "Python": 1991, "JavaScript": 1995]

print(programmingLanguages["Swift"]!)

// Task 4: Create an array of four colors
var colors = ["Red", "Blue", "Green", "Yellow"]

colors[1] = "Purple"

print(colors)

//Medium Tasks
// Task 5: Create two sets of integers
let setA: Set = [1, 2, 3, 4]
let setB: Set = [3, 4, 5, 6]

let intersection = setA.intersection(setB)
print(intersection)

// Task 6: Create a dictionary with student names and scores
var studentScores = ["Alice": 85, "Bob": 92, "Charlie": 78]

studentScores["Bob"] = 95

print(studentScores)

// Task 7: Create two arrays
let array1 = ["apple", "banana"]
let array2 = ["cherry", "date"]

let mergedArray = array1 + array2

print(mergedArray)

//Hard Tasks
// Task 8: Create a dictionary with countries and populations
var countryPopulations = ["USA": 331_000_000, "Canada": 37_000_000, "Mexico": 126_000_000]

countryPopulations["Brazil"] = 213_000_000

print(countryPopulations)

// Task 9: Create two sets
let setC: Set = ["cat", "dog"]
let setD: Set = ["dog", "mouse"]

let unionSet = setC.union(setD)

let finalSet = unionSet.subtracting(setD)

print(finalSet)

// Task 10: Create a dictionary with student names and their grades
let studentGrades = [
    "Alice": [88, 92, 95],
    "Bob": [79, 85, 90],
    "Charlie": [100, 98, 95]
]

print(studentGrades["Bob"]![1])
