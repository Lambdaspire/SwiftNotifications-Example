
import SwiftUI
import LambdaspireSwiftNotifications
import LambdaspireDependencyResolution

struct ContentView : View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var serviceLocator: ServiceLocator
    
    var body: some View {
        Button {
            notificate()
        } label: {
            Label("Request Notifications", systemImage: "bell.fill")
        }
        .sheet(item: $appState.reviewingEmployeeName) { e in
            // Use your imagination.
            Text("Performance Review for \(e)")
        }
        .task {
            await serviceLocator.resolve(NotificationService.self).requestPermission()
        }
    }
    
    private func notificate() {
        Task {
            let employees = await serviceLocator
                .resolve(EmployeeDatabase.self)
                .getMySubordinates()
            
            for employee in employees {
                await serviceLocator
                    .resolve(NotificationService.self)
                    .requestNotification(.init(
                        identifier: .init(),
                        date: thisAfternoon,
                        categoryIdentifier: "EmployeePerformanceReview",
                        title: "\(employee.name)",
                        subtitle: "Performance Review",
                        body: "Supply a rating or write a note.",
                        data: EmployeePerformanceReviewRequestData(employeeName: employee.name),
                        actions: [
                            .button(
                                identifier: PerformanceRatingActionIdentifier(rating: "Good"),
                                title: "Good",
                                icon: "hand.thumbsup.fill",
                                requiresForeground: false),
                            .button(
                                identifier: PerformanceRatingActionIdentifier(rating: "Bad"),
                                title: "Bad",
                                icon: "hand.thumbsdown.fill",
                                requiresForeground: false),
                            .userInput(
                                identifier: WrittenNoteActionIdentifier(),
                                title: "Write a note",
                                icon: "pencil.line",
                                buttonTitle: "Done",
                                placeholder: "Write a note for HR")
                        ]))
            }
        }
    }
}

fileprivate var thisAfternoon: Date {
    // Just pretend.
    .now.addingTimeInterval(1)
}

extension String : Identifiable {
    public var id: String { self }
}
