
import LambdaspireAbstractions
import LambdaspireSwiftNotifications
import LambdaspireDependencyResolution

@Resolvable
class DefaultHandler : NotificationActionHandler {
    
    private let appState: AppState
    
    func handle(
        _ actionIdentifierData: DefaultNotificationActionIdentifier,
        _ requestData: EmployeePerformanceReviewRequestData,
        _ userInput: UserInput) async {

            // The default action brings the app into the foreground,
            // so show the performance review UI for the relevant employee.
            await appState.reviewEmployeePerformance(requestData.employeeName)
        }
}
