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

// Task 1
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

extension IssueList {
    var lastIssue: T? {
        return items.last
    }
}

protocol IssueStorage {
    associatedtype Item
    var items: [Item] { get set }
    
    mutating func add(item: Item)
    mutating func remove() -> Item?
}

class BugStorage: IssueStorage {
    var items: [Bug] = []
    
    func add(item: Bug) {
        items.append(item)
    }
    
    func remove() -> Bug? {
        return items.popLast()
    }
}

var bugList = IssueList<Bug>()
let bug1 = Bug(id: 1, summary: "Bug 1", reporter: "Reporter 1", date: Date(), severity: .high, priority: .blocker, assignee: "Assignee 1", status: .open, fixedInVersion: "1.1", stepsToReproduce: nil)
let bug2 = Bug(id: 2, summary: "Bug 2", reporter: "Reporter 2", date: Date(), severity: .medium, priority: .critical, assignee: "Assignee 2", status: .open, fixedInVersion: "1.1", stepsToReproduce: nil)

//func test<T: Equatable>(counter: Int) ->Int

bugList.add(item: bug1)
bugList.add(item: bug2)
print(bugList.getCount())
print(bugList.lastIssue!)

let BugStr = BugStorage()
BugStr.add(bug1)

