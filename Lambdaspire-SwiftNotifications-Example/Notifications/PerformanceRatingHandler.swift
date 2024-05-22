
import LambdaspireSwiftNotifications

struct PerformanceRatingActionIdentifier : NotificationActionIdentifier {
    var rating: String
}

struct PerformanceRatingHandler : NotificationActionHandler {
    static func handle(
        _ actionIdentifierData: PerformanceRatingActionIdentifier,
        _ requestData: EmployeePerformanceReviewRequestData,
        _ userInput: UserInput,
        _ resolver: DependencyResolver) async {

            // The user has supplied a rating directly from the notification,
            // so update the database accordingly.
            await resolver
                .resolve(EmployeeDatabase.self)!
                .saveReview(employeeName: requestData.employeeName, rating: actionIdentifierData.rating)
        }
}
