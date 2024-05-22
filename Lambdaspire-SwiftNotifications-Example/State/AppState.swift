
import Combine

class AppState : ObservableObject {
    
    @Published var reviewingEmployeeName: String?
    
    @MainActor
    func reviewEmployeePerformance(_ employeeName: String) {
        reviewingEmployeeName = employeeName
    }
}
