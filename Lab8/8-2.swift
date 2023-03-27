protocol BugTracker {
    var bugs: [Bug] { set get }
    func create(bug: Bug)
    func assign(bug: Bug, assignee: String)
    func changeStatus(bug: Bug, status: Status)
    func sortBugs() -> [Bug]
}

class JIRA : BugTracker {
    var bugs: [Bug] = []
    
    func create(bug: Bug) {
        bugs.append(bug)
    }
    
    func assign(bug: Bug, assignee: String) {
        bug.assignee = assignee
    }
    
    func changeStatus(bug: Bug, status: Status) {
        bug.status = status
    }
    
    func sortBugs() -> [Bug] {
        return bugs.sorted {
            $0.priority.rawValue > $1.priority.rawValue
        }
    }
}

extension BugTracker {
    func showReport() {
        print("Bugs count: \(self.bugs.count)")
    }
}

var jira = JIRA()
jira.create(bug: bug)
jira.create(bug: bug)
jira.create(bug: bug)
jira.showReport()