/*: [< Previous](@previous)                    [Home](1%20Home)                    [Next >](@next)
 # Binary Search

## Recursion method:
*/
func findRecursively(in array: ArraySlice<Int>, for value: Int) -> Int? {
    guard array.count > 0 else { return nil }
    
    let middleIndex = array.count / 2
    let middleSliceIndex = array.startIndex + middleIndex
    
    switch array[middleSliceIndex] {
    case let middleValue where middleValue > value:
        return findRecursively(in: array.prefix(middleIndex), for: value)
    case let middleValue where middleValue < value:
        return findRecursively(in: array.suffix(from: middleSliceIndex + 1), for: value)
    default:
        return middleSliceIndex
    }
}

/*:
## Iterative method:
*/
func findIteratively(in array: Array<Int>, for value: Int) -> Int {
   return -1
}

/*:
## Let's try some tests:
*/
    let itemsRange = 0..<20 // number of items in array
    let valuesRange = 0..<1000 // item values range
    let array = itemsRange.map { _ in Int.random(in: valuesRange) }.sorted() // a sorted array
    let indexToFind = Int.random(in: itemsRange) // index to be find by a value
    let valueToFind = array[indexToFind] // a value to be find in the index
    let foundIndex = findRecursively(in: array[...], for: valueToFind) ?? -1 // run recursive binary search
    print("Recursive binary search algorithm is correct:", foundIndex == indexToFind) // check the result

//: [< Previous](@previous)                    [Home](1%20Home)                    [Next >](@next)
