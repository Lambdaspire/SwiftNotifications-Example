
import Combine

class EmployeeDatabase : ObservableObject {
    
    func getMySubordinates() async -> [Employee] {
        fakeEmployees
    }
    
    func saveReview(employeeName: String, rating: String) async {
        // Use your imagination.
    }
}

struct Employee {
    var name: String
}

fileprivate let fakeEmployees: [Employee] = [
    .init(name: "Skylark"),
    .init(name: "R.O.D"),
    .init(name: "ChatGPT")
]
