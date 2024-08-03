
import SwiftUI
import LambdaspireLogging
import LambdaspireAbstractions
import LambdaspireSwiftNotifications
import LambdaspireDependencyResolution

@main
struct Lambdaspire_SwiftNotifications_ExampleApp : App {
    
    private let container: Container = .default
    
    init() {
        Log.setLogger(PrintLogger())
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().with(container)
        }
    }
}
