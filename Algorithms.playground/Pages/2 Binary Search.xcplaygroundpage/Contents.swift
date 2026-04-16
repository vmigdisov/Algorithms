/*: [< Previous](@previous)                    [Home](1%20Home)                    [Next >](@next)
 # Binary Search

## Recursion method:
*/
func findRecursively(in array: ArraySlice<Int>, for value: Int) -> Int? {
    guard array.count > 0 else { return nil }
    
    let middleIndex = array.startIndex + array.count / 2
    
    switch array[middleIndex] {
    case let middleValue where middleValue > value:
        return findRecursively(in: array.prefix(upTo: middleIndex), for: value)
    case let middleValue where middleValue < value:
        return findRecursively(in: array.suffix(from: middleIndex + 1), for: value)
    default:
        return middleIndex
    }
}

/*:
## Iterative method:
*/
func findIteratively(in array: Array<Int>, for value: Int) -> Int {
   return -1
}

/*:
## Testing:
 
 let's define variables
*/
    let itemsRange = 0..<20 /// number of items in array
    let valuesRange = 0..<1000 /// item values range
    let array = itemsRange.map { _ in Int.random(in: valuesRange) }.sorted() /// a sorted array
    let indexToFind = Int.random(in: itemsRange) /// index to be find by a value
    let valueToFind = array[indexToFind] /// a value to be find in the index
    let testsRange = 0..<10000 /// number of tests
/*:
 let's run a seria of tests
 */
    let recursiveResult = testsRange.allSatisfy { _ in
        findRecursively(in: array[...], for: valueToFind) == indexToFind
    }
    print("Recursive binary search algorithm is correct:", recursiveResult)
//: [< Previous](@previous)                    [Home](1%20Home)                    [Next >](@next)
