
import SwiftUI
import LambdaspireSwiftNotifications
import LambdaspireDependencyResolution

@main
struct Lambdaspire_SwiftNotifications_ExampleApp : App {
    
    @StateObject private var appState: AppState = .init()
    
    private let serviceLocator: ServiceLocator = .default
    
    var body: some Scene {
        WindowGroup {
            ContentView().with(appState, serviceLocator)
        }
    }
}
