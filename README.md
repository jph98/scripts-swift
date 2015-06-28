
#Swift Language

##Cheat Sheets
* Objective C - https://github.com/iwasrobbed/Objective-C-CheatSheet
* Swift - https://github.com/iwasrobbed/Swift-CheatSheet
* XCode Cheat Sheet - http://www.git-tower.com/blog/content/posts/22-xcode-cheat-sheet/xcode-cheat-sheet-large01.png

##Courses
* Swift Course - https://itunes.apple.com/us/course/app-development-teaching-swift/id1003406963

##High Level Features
* Basic Classes
* Func and Class Methods
* Type Inference
* Variables (var, let), Any, AnyObject.
* Use of final and private
* Property Observers
* Strong typing with Generics
* Closures and lambdas
* Multiple return types with Tuples
* Use of Optionals
* Range Matching
* Enums/Structs containing code
* Arrays and Dictionaries, immutability
* Protocols
* Categories/extension methods
* Weak/Unowned and closure capture lists
* Try/Catch with Error enums
* Synthesized Header Files From Swift Files
* Guard vs If
* Defer keyword
* Whole Module Optimization to increase perfroamnce

##Variables

* Constant - let name = "Jon"
* Variable - var name = "Jon"

Unary minus and plus exist.

Nil coalescing operator (return a if unwrapped correctly or b): 

    a ?? b

Ranges exist and so do half open ranges

    for i in 0..<count {}

You can define type aliases if you need more descriptive:

    typealias AudioSample = UInt16
    var maxAmplitudeFound = AudioSample.min

Implicitly unwrapped:

    // Normal optional
    var serverResponseCode: Int? = 404
    // Unwrapped version, always
    var serverResponseCode: Int! = 404

You can use assertions for function parameter checking as well as other purposes:

    assert(age >= 0, "A person's age cannot be less than zero")

Strings and Characters
* String is a value type, copied when passed to a function, unlike with NSString.
* String has append() and += for concat, isEmpty() exists for checking
* Also has insert, splice, removeRange, hasPrefix, hasSuffix


##Functions

    func example(start: Int, end: Int) -> (Int, Int) {}

External parameter names can be used for describing the function parameter:

    func join(string s1: String, toString s2: String, withJoiner joiner: String)
    func containsCharacter(#string: String, #characterToFind: Character) -> Bool

Note, that you can use default values for function parameters also.

Variadic parameters:

    func arithmeticMean(numbers: Double...)
    
Function parameters are constants by default, alternatively define them as variables:

    func alignRight(var string: String, totalLength: Int, pad: Character)
    
If you want to mutate variable parameters passed in through a function, use in-out parameters:

    swap(inout a: Int, inout b: Int)
    // call with
    swap(&someInt, &anotherInt)
    
Function Types are mad eup of parameters and return types, e.g:

    func example(Int: name) -> Int
    // which means
    s (Int) -> (Int)
    
    func example()
    // which means    
    s () -> ()
    
Use these either as parameters to a another function or the return type.  A good way to think about this is as an operation to perform on two numbers (addition or subtraction) for example:

    var mathFunction: (Int, Int) -> Int = addTwoInts
    func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {}
    printMathResult(addTwoInts, 3, 5)
    
Functions can be nested for hiding functionality:

    func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backwards ? stepBackward : stepForward
    }


##Optionals

Defined as follows:

    var name: String? = "Bristol"
    
If you are sure it contains a value you can unpack it with:

    "\(name?)"

##Data Structures

Types of data structures:

* Array

    var a = [String]()

* Standard methods - count, append, isEmpty, remove, contains
* Can get a sub-set by using a range in the array [0..4]

* Set

    var letters = Set<Character>()
    // remove an entry
    letters["A"] = nil
    // iterate with
    for (airportCode, airportName) in airports

* Has union, subtract, intersect etc...

* Dictionary

    let a = [String: Float]()
        
* Tuple

    let somePoint = (1, 1)
    let http404Error = (404, "Not Found")
    
* Iterate with:

    for (value in shoppingList) {}
    for (index, value) in enumerate(shoppingList) {}


Unnamed:
        let tipAndTotal = (2.00, 20.00)
        let tipAndTotal: (Double, Double) = (2.00, 20.00)
        
##Type Checking

Checking the type of an object:

        if item is Movie {}

Downcasting (Conditional and Forced Form):

        if let movie = item as? Movie
        // Use only when you know it will work
        Double((totalTextField.text as NSString).doubleValue)
        
##Control Structures

Basic structures:
* for and for in
* while and do while

switch, case (there's no implict fallthrough)
* Can do value binding - case let (x, y) where x == y:

continue, break (also can break to a label)

fallthrough (for use in a case)

Optional Binding can be used as follows:
        
        if let name = optionalValue { // dostuff }

##Closures

TODO - https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-ID94

##Concurrency

* See Grand Central Dispatch - http://www.raywenderlich.com/79149/grand-central-dispatch-tutorial-swift-part-1

Dispatch Queues
* Serial Queues - execute tasks one at a time
* Concurrent Queues - guaranteed to start in-order

* Main Queue - guaranteed to execute on the main thread.  Only thread allowed to update the UI.
* User Interactive - nice UX, UI updates, event handling and small workloads
* User Initiated - async tasks from the UI.  Tasks required to continue user interaction.
* Utility Class - long running tasks with progress.  Energy efficient. I/O, networking, data feeds etc...
* Background Class - pre-fetching, maintenance and other tasks that don't require user interaction

##Useful Libraries

See - http://www.swifttoolbox.io/

Also see - https://github.com/Wolg/awesome-swift

* Alamofire - elegant HTTP networking
* JSON ObjectMapper - https://github.com/Hearst-DD/ObjectMapper
* Starscream - web sockets
* Caraval - event bus
