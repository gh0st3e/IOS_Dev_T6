import UIKit

enum Severity: String {
    case high
    case medium
    case low
}

enum Priority: String {
    case blocker
    case critical
    case major
    case minor
}

enum Status: String {
    case open
    case closed
    case resolved
    case reopened
    case inProgress
}

class Bug {
    var id: Int
    var summary: String
    var stepsToReproduce: [String]?
    var reporter: String
    var date: Date
    var severity: Severity
    var priority: Priority
    var assignee: String
    var status: Status {
        didSet(oldValue) {
            print("Old value '\(oldValue)' of property status was changed!")
        }
    }
    var fixedInVersion: String?
    lazy var formattedDate: String = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: self.date)
    }()
    
    init(id: Int, summary: String, reporter: String, date: Date, severity: Severity, priority: Priority, assignee: String, status: Status, fixedInVersion: String?, stepsToReproduce: [String]? = nil) {
            self.id = id
            self.summary = summary
            self.stepsToReproduce = stepsToReproduce
            self.reporter = reporter
            self.date = date
            self.severity = severity
            self.priority = priority
            self.assignee = assignee
            self.status = status
            self.fixedInVersion = fixedInVersion
        }
    
    func setPriority(prioity: Priority) {
        self.priority = prioity
    }
    
    func setAssignee(assignee: String) {
        self.assignee = assignee
    }
    
    func setStatus(status: Status) {
        self.status = status
    }
    
    func setResolvedStatus(version: String) {
        self.status = .resolved
        self.fixedInVersion = version
    }
    
    subscript(index: Int) -> String? {
        guard let steps = self.stepsToReproduce, index >= 0 && index < steps.count else {
            return nil
        }
        return steps[index]
    }
}

struct IssueList<T> {
    private var items: [T]
    
    init(_ elements: T...){
        self.items = elements
    }
    
    subscript(i: Int) -> T {
        return items[i]
    }
    
    mutating func add(item: T) {
        items.append(item)
    }
    
    mutating func remove() -> T? {
        return items.popLast()
    }
    
    mutating func getCount() -> Int {
        return items.count
    }
}
// Task 1
extension IssueList {
    static func +(lhs: IssueList<T>, rhs: IssueList<T>) -> IssueList<T> {
        var result = IssueList<T>()
        result.items = lhs.items + rhs.items
        return result
    }
}

func divide(a: Int, b: Int) throws -> Int {
    guard b != 0 else {
        throw NSError(domain: "Division by zero", code: 0, userInfo: nil)
    }
    return a / b
}

do {
    let result = try divide(a: 10, b: 0)
    print(result)
}
catch {
    print("Error: \(error)")
}
