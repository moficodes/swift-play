import Cocoa

// Variables
var str = "Hello, playground"
let apples = 3
let oranges = 5
// String interpolation
let data = """
I have \(apples) apples and \(oranges) oranges.
"""
print(data)

// array
var shoppingList = ["catfish", "water", "tulips"]
print(shoppingList)

print(shoppingList[2])

// dictionary
var occupations = [
    "Malcom": "Captain",
    "Kylee": "Mechanic",
]

print(occupations)

// adding things to array
occupations["Nathan"] = "Plumber"
shoppingList.append("bread")

print(shoppingList.count)
print(occupations.count)

// dictionary keys
print(occupations.keys)


// empty arr
let emptyArr = [String]()
let emptyDict = [String: Float]()


// control flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
// array traversal
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


// Optionals
var optionalString: String? = "Hello"

print(optionalString == nil)

var optionalName: String? = "Jone Appleseed"

var greeting: String
if let name = optionalName {
    greeting = "Hello \(name)"
    print(greeting)
}

let nickname: String? = "Jonny"

let fullname: String = "John Applebottom"

let informalName = "\(nickname ?? fullname)"

let vegetables = "red pepper"

// switch cases
switch vegetables {
case "celery":
    print("its celery")
case "cucumber", "watercross":
    print("one of two")
case let x where x.hasSuffix("pepper"):
    print("spice spice baby")
default:
    print("i dont know what it is \(vegetables)")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var from = ""

// Traverse map and array
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            from = kind
        }
    }
}

print("Largest num is \(largest) from \(from) list")

// repeat while
var m = 2
repeat {
    m *= 2
} while m < 100

print(m)

// range loops
var total = 0
for i in 0..<10 {
    total += i
}

print(total)

// funcitons
func greet(_ person: String,on day: String) -> String{
    return "Hello \(person), today is \(day)"
}

greet("bob", on:"saturday")

// funciton multireturn
func calculateStats(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStats(scores: [5,3,100,15,73])

print(statistics)

print(statistics.max)

var numbers = [5, 10 , 15, 2, 6, 9]
let sorted = numbers.sorted{$0 < $1}
print(sorted)

// closures
let val = numbers.map({ number in 5 * number })

print(val)

// function can take functions as param also return functions



// class
class Shape {
    var numberOfSides = 0
    // method
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides"
    }
}

var shape = Shape()
shape.numberOfSides = 7

shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    // special funciton
    // constructor
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength) and area \(area())"
    }
}

let test = Square(sideLength: 5.2, name: "test square")

print(test.simpleDescription())

// extend class
class EqulateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    // getter and setter
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "A equilateral triangle with sides of length \(sideLength) and perimeter of \(perimeter)"
    }
}

var triangle = EqulateralTriangle(sideLength: 3.1, name: "triangle")

print(triangle.simpleDescription())

triangle.perimeter = 9.9

print(triangle.simpleDescription())

class TriangleAndSquare {
    // willset modify other value as part of set
    var triangle: EqulateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength =  newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EqulateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test")

print(triangleAndSquare.square.simpleDescription())

print(triangleAndSquare.triangle.simpleDescription())

triangleAndSquare.square = Square(sideLength: 50, name: "squarito")

print(triangleAndSquare.square.simpleDescription())

print(triangleAndSquare.triangle.simpleDescription())


// optional
//let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional.square")
let optionalSquare: Square? = nil

print(optionalSquare?.simpleDescription())


// enums

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
ace.simpleDescription()


var three: String?
if let convertedRank = Rank(rawValue: 8) {
    three = convertedRank.simpleDescription()
}

print(three ?? "no val")


enum Suit: CaseIterable {
    case spades, hearts, diamonds, clubs

    // enum function
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .diamonds, .hearts:
            return "red"
        }
    }
}

let hearts = Suit.hearts

print(hearts.simpleDescription())
print(hearts.color())

// enum types could be functions as well

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cables")

switch success {
case let .result(sunrise, sunset):
    print("sunrise at \(sunrise), sunset at \(sunset)")
case let .failure(message):
    print("Failure...\(message)")
}

// structs

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func deck() -> [Card] {
        var res = [Card]()
        for suit in Suit.allCases {
            for rank in 1..<14{
                res.append(Card(rank: Rank(rawValue: rank)!, suit:suit))
            }
        }
        return res
    }
}

let card = Card(rank: .three, suit: .spades)
print(card.simpleDescription())

let deck = card.deck()

for card in deck {
    card.simpleDescription()
}

deck[10].simpleDescription()

// protocol (interface)
protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " now 100% adjusted"
    }

    var simpleDescription: String = "A very simple class"
}

var a = SimpleClass()
a.adjust()

print(a.simpleDescription)

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "A simple struct"

    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}

var b = SimpleStruct()
b.adjust()
print(b.simpleDescription)


// extend some class that we didnt write to do things we want. cool
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "the number \(self)"
    }

    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)


let protocolVal: ExampleProtocol = a

print(protocolVal.simpleDescription)


// Error handling

enum PrintError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has toner" {
        throw PrintError.noToner
    }
    
    return "job sent"
}

// try catch -> do try catch
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never has toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    throw PrintError.onFire
    print(printerResponse)
} catch PrintError.onFire {
    print("Fire! Fire! Fire!")
} catch let printerError as PrintError {
    print("Printer Error \(printerError)")
} catch {
    print(error)
}

// try without catch. let the error fall through and value as optional
var printErr = try? send(job: 1220, toPrinter: "Never has toner")
print(printErr ?? "Nothing")

// ? to unwrap. ! force unwrap ?? unwrap or

// defer execute block before exit

var fridgeIsOpen = false
var frideConent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = frideConent.contains(food)
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

