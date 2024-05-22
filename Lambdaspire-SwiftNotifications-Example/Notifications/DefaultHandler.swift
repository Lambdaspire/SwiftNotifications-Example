
import LambdaspireSwiftNotifications

struct DefaultHandler : NotificationActionHandler {
    static func handle(
        _ actionIdentifierData: DefaultNotificationActionIdentifier,
        _ requestData: EmployeePerformanceReviewRequestData,
        _ userInput: UserInput,
        _ resolver: DependencyResolver) async {

            // The default action brings the app into the foreground,
            // so show the performance review UI for the relevant employee.
            await resolver
                .resolve(AppState.self)!
                .reviewEmployeePerformance(requestData.employeeName)
        }
}
