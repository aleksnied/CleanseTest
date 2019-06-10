# CleanseTest
Playing around with Cleanse Dependency Injection :)

This is a simple project to try out https://github.com/square/Cleanse, iOS' answer to Dagger from Square.

The project sets up a very simple object graph:

App Delegate root component depends on a singleton Coordinator Module.
Coordinator Module depends on a singleton UIWindow and a tagged 'Root' ViewController provider.
ViewController depends on ViewModel.

The object graph is instantiated on app start and AppDelegate is injected with the main app coordinator.
The app does not use a storyboard entry point, instead the AppDelegate calls on the coordinator to "navigateToRoot":
configure the app window with a root VC and make it visible.

The root VC is instantiated from Styboard via its identifier. Since we don't control it's init method, we inject the ViewModel
via property injection, just like with the AppDelegate.
