//  HW_Collection_And_Control_Flow
//
//  Created by ChenAlan on 2018/2/7.
//
//  Remote Assignment - Week 1
/*
 -----------------------------------
 Swift Collection and Control Flow
 -----------------------------------
 */

import Foundation

/*
 ------
 Array
 ------
 */

// 1. Create an array

var myFriends = [String]()

// 2. Add elements to an array

myFriends += ["Ian", "Bomi", "Kevin"]

// 3. Add elements to an array

myFriends += ["Michael"]

// 4. Modify an array

myFriends = myFriends.filter { $0 != "Kevin"}
myFriends.insert("Kevin", at: 0)

// 5. Print all the elements of an array

// for in loop
for name in myFriends {
    print(name)
}
// forEach loop
myFriends.forEach() { print($0) }

// 6. Range of an array

let personAtIndexFive = myFriends.count > 5 ? myFriends[5] : "Can not find a name at index '5'. The last index of this array is '\(myFriends.count - 1)'."
// use Nil-Coalescing Operator to check if an array index is out of range
// it turns out that index '5' is out of range because 'myFriends' has only '4' names, which means the index is '3' at most


/*
 -----------
 Dictionary
 -----------
 */

// 1. Create a dictionary

var myCountryNumber = [String: Int]()

// 2. Add key-value pairs to a dictionary

myCountryNumber = ["US": 1, "GB": 44, "JP": 81]

// 3. Remove a key-value pair from a dictionary

myCountryNumber.removeValue(forKey: "US")

// 4. Modify values of a dictionary

myCountryNumber.updateValue(0, forKey: "GB")
myCountryNumber

// 5. Create one array containing all keys and another having all values

var keys = Array(myCountryNumber.keys)
var values = Array(myCountryNumber.values)


/*
 --------------------
 For, While, Repeat
 --------------------
 */

// 1. Print all the elements of arrays or dictionaries
for friend in myFriends {
    print(friend)
}

for (country, number) in myCountryNumber {
    print(country, number)
}

// 2. Loop over a range
let lottoNumbers = [10, 9, 8, 7, 6, 5]

for index in (lottoNumbers.count - 3)..<lottoNumbers.count {
    print(lottoNumbers[index])
}

// 3. stride(from: to: by:) stride(from: through: by:)
for index in stride(from: lottoNumbers.count - 1, through: 0, by: -1) {
    print(lottoNumbers[index])
}

for index in stride(from: 0, to: lottoNumbers.count, by: 2) {
    print(lottoNumbers[index])
}

// 4. while loop
var index = lottoNumbers.count - 1
while index >= 0 {
    print(lottoNumbers[index])
    index -= 1
}

index = 0
while index < lottoNumbers.count {
    print(lottoNumbers[index])
    index += 2
}

// 5. repeat-while loop
index = lottoNumbers.count - 1
repeat {
    print(lottoNumbers[index])
    index -= 1
}while index >= 0

index = 0
repeat {
    print(lottoNumbers[index])
    index += 2
} while index < lottoNumbers.count


/*
 -------------
 If statement
 -------------
 */

// 1. if statement
var isRaining = true
if isRaining {
    print("It's raining, I don't want to work today.")
} else {
    print("Although it's sunny, I still don't want to work today.")
}


/*
 -------
 Switch
 -------
 */

// 1. switch
var jobLevel = 4
switch jobLevel {
case 1: print("Member")
case 2: print("Team Leader")
case 3: print("Manager")
case 4: print("Director")
default: print("We don't have this job")
}

