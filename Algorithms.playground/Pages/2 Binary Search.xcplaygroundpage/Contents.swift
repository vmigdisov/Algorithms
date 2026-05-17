/*: [< Previous](@previous)                    [Home](1%20Home)                    [Next >](@next)
 # Binary Search

## Recursive method:
*/
// Time: O(log n)
// Space: O(log m)
func findRecursively(in slice: ArraySlice<Int>, for value: Int) -> Int? {
    guard slice.count > 0 else { return nil }
    
    let middleIndex = slice.startIndex + slice.count / 2
    
    switch slice[middleIndex] {
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
// Time: O(log n)
// Space: O(1)
func findIteratively(in array: Array<Int>, for value: Int) -> Int? {
    var slice: ArraySlice<Int> = ArraySlice(array)
    
    while slice.count > 0 {
        let middleIndex = slice.startIndex + slice.count / 2
        
        switch slice[middleIndex] {
        case let middleValue where middleValue > value:
            slice = slice.prefix(upTo: middleIndex)
        case let middleValue where middleValue < value:
            slice = slice.suffix(from: middleIndex + 1)
        default:
            return middleIndex
        }
    }
    return nil
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

    let iterativeResult = testsRange.allSatisfy { _ in
        findIteratively(in: array, for: valueToFind) == indexToFind
    }
    print("Iterative binary search algorithm is correct:", iterativeResult)
//: [< Previous](@previous)                    [Home](1%20Home)                    [Next >](@next)
