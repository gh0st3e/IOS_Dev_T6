import UIKit
import Foundation
import Combine

// Task 1
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
    
    convenience init?(id: Int, summary: String, reporter: String, date: Date, severity: String, priority: String, assignee: String?, status: String, fixedInVersion: String?, stepsToReproduce: [String]? = nil) {
        guard let severity = Severity(rawValue: severity), let priority = Priority(rawValue: priority),let status = Status(rawValue: status) else {
            return nil
        }
            
        self.init(id: id, summary: summary, reporter: reporter, date: date, severity: severity, priority: priority, assignee: assignee!, status: status, fixedInVersion: fixedInVersion, stepsToReproduce: stepsToReproduce)
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
let bug = Bug(id: 1, summary: "Bug summary", reporter: "John Doe", date: Date(), severity: .high, priority: .critical, assignee: "", status: .open, fixedInVersion: nil, stepsToReproduce: ["Step 1", "Step 2", "Step 3"])

class UIBug: Bug {
    let affectedElement: String
    
    init(id: Int, summary: String, reporter: String, date: Date, severity: Severity, priority: Priority, assignee: String, status: Status, fixedInVersion: String?, stepsToReproduce: [String]? = nil, affectedElement: String) {
        self.affectedElement = affectedElement
        super.init(id: id, summary: summary, reporter: reporter, date: date, severity: severity, priority: priority, assignee: assignee, status: status, fixedInVersion: fixedInVersion)
    }
}

class PerformanceBug: Bug {
    let affectedModule: String
    
    init(id: Int, summary: String, reporter: String, date: Date, severity: Severity, priority: Priority, assignee: String, status: Status, fixedInVersion: String?, stepsToReproduce: [String]? = nil, affectedModule: String) {
        self.affectedModule = affectedModule
        super.init(id: id, summary: summary, reporter: reporter, date: date, severity: severity, priority: priority, assignee: assignee, status: status, fixedInVersion: fixedInVersion)
    }
}

var bugs: [Any] = [
    Bug(id: 1, summary: "UI Element not displaying correctly", reporter: "John Doe", date: Date(), severity: .medium, priority: .major, assignee: "", status: .open, fixedInVersion: nil, stepsToReproduce: nil, affectedElement: "Login button"),
    PerformanceBug(id: 2, summary: "Perfomance not displaying correctly", reporter: "John Doe", date: Date(), severity: .medium, priority: .major, assignee: "", status: .open, fixedInVersion: nil, stepsToReproduce: nil, affectedModule: "Data loading"),
    UIBug(id: 3, summary: "UI Element not displaying correctly", reporter: "John Doe", date: Date(), severity: .medium, priority: .major, assignee: "", status: .open, fixedInVersion: nil, stepsToReproduce: nil, affectedElement: "Login button")
]
let sortedBugs = bugs.sorted { (bug1, bug2) -> Bool in
    if let bug1 = bug1 as? UIBug, let bug2 = bug2 as? UIBug {
        return bug1.affectedElement < bug2.affectedElement
    }
    else if let bug1 = bug1 as? PerformanceBug, let bug2 = bug2 as? PerformanceBug {
        return bug1.affectedModule < bug2.affectedModule
    }
    else if let bug1 = bug1 as? Bug, let bug2 = bug2 as? Bug{
        return bug1.summary < bug2.summary 
    }
    else {
        return false
    }
}
print(sortedBugs)
