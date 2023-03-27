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
extension Int {
    func isEven() -> Bool {
        return ((self % 2 == 0) ? true : false)
    }
    
    subscript(digit: Int) -> Int {
        var countOfDigits = 0
        var num = self
        while num > 0 {
            if num % 10 == digit {
                num = Int(num / 10)
                countOfDigits += 1
            }
        }
        return countOfDigits
    }
}
print(2.isEven())
print(222[2])

extension Bug {
    convenience init(id: Int, summary: String, reporter: String, date: Date, severity: Severity, priority: Priority, assignee: String, status: Status, versionFixed: String?) {
            self.init(id: id, summary: summary, reporter: reporter, date: date, severity: severity, priority: priority, assignee: assignee, status: status, versionFixed: versionFixed)
    }
    
    func daysToFixCount() -> Int {
        if self.status != .closed {
            return Int(Date().timeIntervalSince(self.date) / (60 * 60 * 24))
        }
        return 0
    }
    
    func reOpen() {
        self.date = Date()
        self.status = .reopened
    }
}

let bug = Bug(id: 1, summary: "Bug summary", reporter: "John Doe", date: Date(timeInterval: -60 * 60 * 24 * 5, since: Date()), severity: .high, priority: .critical, assignee: "", status: .open, fixedInVersion: nil, stepsToReproduce: ["Step 1", "Step 2", "Step 3"])
print(bug.daysToFixCount())