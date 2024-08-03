
import LambdaspireAbstractions
import LambdaspireSwiftNotifications
import LambdaspireDependencyResolution

struct PerformanceRatingActionIdentifier : NotificationActionIdentifier {
    var rating: String
}

@Resolvable
class PerformanceRatingHandler : NotificationActionHandler {
    
    private let employeeDatabase: EmployeeDatabase
    
    func handle(
        _ actionIdentifierData: PerformanceRatingActionIdentifier,
        _ requestData: EmployeePerformanceReviewRequestData,
        _ userInput: UserInput) async {

            // The user has supplied a rating directly from the notification,
            // so update the database accordingly.
            await employeeDatabase.saveReview(employeeName: requestData.employeeName, rating: actionIdentifierData.rating)
        }
}
