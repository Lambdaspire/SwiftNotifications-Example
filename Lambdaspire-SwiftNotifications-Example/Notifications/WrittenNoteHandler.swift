
import LambdaspireSwiftNotifications

struct WrittenNoteActionIdentifier : NotificationActionIdentifier {
    // Empty - use UserInput instead.
}

struct WrittenNoteHandler : NotificationActionHandler {
    static func handle(
        _ actionIdentifierData: WrittenNoteActionIdentifier,
        _ requestData: EmployeePerformanceReviewRequestData,
        _ userInput: UserInput,
        _ resolver: DependencyResolver) async {

            guard let userInput else { return }

            // The user has written a note rather than supplying a rating,
            // so notify HR post-haste.
            await resolver
                .resolve(HumanResources.self)!
                .notify("Regarding \(requestData.employeeName): \(userInput)")
        }
}
