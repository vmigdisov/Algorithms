/*: [Previous](@previous)

## Persistent immutable functional list
*/
indirect enum LinkedList<Element> {
    case node(value: Element, next: LinkedList<Element>)
    case tail
}

extension LinkedList {
    
    // O(1)
    func prepend(_ value: Element) -> LinkedList<Element> {
        .node(value: value, next: self)
    }
    
    // O(n)
    func append(_ value: Element) -> LinkedList<Element> {
        switch self {
        case .tail:
            return .node(value: value, next: .tail)
        case .node(let currentValue, let next):
            return .node(
                value: currentValue,
                next: next.append(value)
            )
        }
    }
    
    // O(n)
    var count: Int {
        switch self {
        case .tail: return 0
        case .node(_, let next): return 1 + next.count
        }
    }
    
    // O(n²)
    var array: [Element] {
        switch self {
        case .tail: return []
        case .node(let value, let next): return [value] + next.array
        }
    }
    
    // O(n)
    var efficientArray: [Element] {
        var result: [Element] = []
        var current = self
        while case let .node(value, next) = current {
            result.append(value)
            current = next
        }
        return result
    }
    
    var last: LinkedList<Element> {
        var current = self
        while case let .node(_, next) = current {
            if case .tail = next {
                return current
            }
            current = next
        }
        return .tail
        
    }
}

//: ## Examples
let a = LinkedList.tail.prepend(2).prepend(1)
let count = a.count
let last = a.last
let b = a.prepend(0)
let c = b.append(3).last
//: [Next](@next)
