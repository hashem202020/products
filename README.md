# Products App 

## Overview

This project is a SwiftUI application that displays a list of products. Each product is presented in a card format within a scroll view. The app loads all products, showing details such as the product's name, image, and price. Users can tap on a character to view more detailed information, then user can add this product to cart or buy it now.

## Instructions for Building and Running the Application

### Prerequisites

- Xcode 16.0 or later
- macOS 14.0 or later

### Steps to Build and Run
1. Clone the Repository:
   git clone https://github.com/hashem202020/products
   cd productsShop.
                        
2. **Open the Project**:
Open the .xcodeproj file in Xcode:
open productsShop.xcodeproj

3. **Select a Simulator or Device**:
In Xcode, select a simulator (like iPhone 16) from the device list.

4. **Build the Project**:
Press Command + B to build the project and ensure there are no errors.

5. **Run the Application**:
Press Command + R to run the application on the selected simulator or device.                            


## Features

- products List: Displays a list of products loaded from an API, showing name, price and image.
- Character Details: Each product card shows the products's name, image, description, and 2 CTAs.
- Navigation: Users can tap on a product to view detailed information about that product.
- Add to cart: When you click the Add to Cart button, the selected item is added to the cart, and a badge appears with the number of items in the cart.
- Remove from cart: When you click the Remove from Cart button, the selected item is removed from the cart, and the counter badge reflects this change.

## Architecture

### Clean Architecture

- This application is structured using Clean Architecture principles, which separates concerns into different layers, improving maintainability and testability. The key layers include:
    - Presentation Layer: Contains SwiftUI views and ViewModels. This layer is responsible for interacting with the user interface and receiving input.
    - Domain Layer: Contains the business logic and entities. This layer is independent of any frameworks or UI.
    - Data Layer: Manages data sources such as APIs, databases, and local storage. This layer handles data retrieval and storage.

### MVVM (Model-View-ViewModel)

The app uses the MVVM pattern to separate the UI from business logic:
- Model: Represents the data and its business logic.
- View: The SwiftUI and UIKit views that display the data.
- ViewModel: Acts as an intermediary between the View and the Model, managing the data presentation logic and state.

## Assumptions and Decisions Made During the Test

- Use of UIKit with SwiftUI: The decision to use a UINavigationController alongside SwiftUI views was made to allow for more control over navigation and to customize the navigation bar's appearance.
- Coordinator Pattern: Implemented a coordinator pattern to centralize navigation logic and manage view transitions, enhancing code maintainability.
- Transparent Navigation Bar: The navigation bar was made transparent to meet design specifications and to improve the overall aesthetic of the application.
- Async over Combine: Decided to use Swift's async/await for the network layer instead of Combine. This decision was made for simplicity and readability, allowing for more straightforward asynchronous code without the additional complexity of Combine's publishers and subscriptions.

## Challenges Encountered and How They Were Addressed

1. Black Screen Issue:
Challenge: After switching from the @main struct to using the AppDelegate, a black screen appeared when launching the app.
Solution: Ensured that the UIWindow was properly initialized and that the root view controller was set correctly. Verified that the UIHostingController was being instantiated with a valid SwiftUI view, removed UIApplicationSupportsMultipleScenes from info.plist.

## Future Improvements

- Enhanced Error Handling: Implement better error handling for network requests and user inputs.
- More Features: Expand the app with additional features, such as refreshing the products list, sorting options, or additional product details.
