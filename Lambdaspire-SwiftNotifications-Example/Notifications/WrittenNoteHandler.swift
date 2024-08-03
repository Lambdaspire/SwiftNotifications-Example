
import LambdaspireAbstractions
import LambdaspireSwiftNotifications
import LambdaspireDependencyResolution

struct WrittenNoteActionIdentifier : NotificationActionIdentifier {
    // Empty - use UserInput instead.
}

@Resolvable
class WrittenNoteHandler : NotificationActionHandler {
    
    private let humanResources: HumanResources
    
    func handle(
        _ actionIdentifierData: WrittenNoteActionIdentifier,
        _ requestData: EmployeePerformanceReviewRequestData,
        _ userInput: UserInput) async {

            guard let userInput else { return }

            // The user has written a note rather than supplying a rating,
            // so notify HR post-haste.
            await humanResources.notify("Regarding \(requestData.employeeName): \(userInput)")
        }
}
