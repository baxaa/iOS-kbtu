import UIKit

import Foundation


var firstName: String = "Baqbergen"
var lastName: String = "Onalbekov"
var age: Int = 20
let birthYear: Int = 2004
let currentYear: Int = 2024
var isStudent: Bool = true
var height: Double = 1.65

age = currentYear - birthYear

var favoriteColor: String = "Blue"
var cityOfBirth: String = "Shymkent"
var currentJob: String = "Backend Developer"

var hobby: String = "Coding"
var numberOfHobbies: Int = 1
var favoriteNumber: Int = 4
var isHobbyCreative: Bool = false

var futureGoals: String = "In the future, I want to become a CTO of a tech company."

let lifeStory = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). \
I am currently \(isStudent ? "a student" : "not a student"). I live in \(cityOfBirth), \
and I work as a \(currentJob). I am \(height) meters tall. My favorite hobby is \(hobby), \
which is \(isHobbyCreative ? "a creative" : "not a creative") hobby. I have \(numberOfHobbies) hobbies. My favorite number is \(favoriteNumber).
"""

print(lifeStory)

var futureGoalEmoji: String = "🚀"
var currentJobEmoji: String = "👨‍💻"
var favoriteHobbyEmoji: String = "💻"
let lifeStoryWithEmojis = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). \
I am currently \(isStudent ? "a student" : "not a student") \(currentJobEmoji). I live in \(cityOfBirth). \
I enjoy \(hobby) \(favoriteHobbyEmoji), and in the future \(futureGoalEmoji) \(futureGoals).
"""
print(lifeStoryWithEmojis)
