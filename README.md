# SwiftNotifications Example

Shows how to use the [Lambdaspire - Swift Notifications package](https://github.com/Lambdaspire/SwiftNotifications).

## Files to pay attention to

If you're grokking it, in order:

- **Lambdaspire_SwiftNotifications_ExampleApp.swift**
  - Creates the Dependency Resolver and stuffs it into @Environment with some other app state.
- **DefaultServiceLocator.swift**
  - Shows how to create the NotificationService instance and register handlers, as well as use the BasicServiceLocator as a DependencyResolver.
- **ContentView.swift**
  - Demonstrates app state that is shared with notification handlers.
  - Demonstrates scheduling notifications.
- **/Notifications folder**
  - Notification action identifiers, response handlers, and request data types.

https://github.com/Lambdaspire/SwiftNotifications-Example/assets/103079506/320de141-b064-40e3-865a-2c0fc37890ac

