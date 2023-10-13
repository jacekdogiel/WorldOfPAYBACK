# WorldOfPAYBACK

## Overview

This iOS app is designed to display a list of transactions fetched from an API endpoint (for now uses json mock file). It utilizes SwiftUI for the user interface and follows the MVVM (Model-View-ViewModel) architecture pattern.

## Project Structure

### Models

- `TransactionsResponse`: Represents the response structure from the API, containing an array of `Transaction` objects.
- `Transaction`: Represents a single transaction, conforming to `Identifiable` and `Decodable` protocols.
- `TransactionDetail`: Represents detailed information about a transaction, including a description, booking date, and value.
- `TransactionValue`: Represents the monetary value of a transaction, including amount and currency.

### Views

- `TransactionsListView`: The main view displaying the list of transactions with filtering options.
- `TransactionRowView`: Represents a single row in the transaction list.
- `TransactionDetailView`: Displays detailed information about a selected transaction.
- `ListFeature`: Feature view that combines list and detail views using the `ListRouter`.

### View Models

- `TransactionsListViewModel`: Manages the data flow between the UI (`TransactionsListView`) and the data source.

### Services

- `TransactionRemoteService`: Implements `TransactionLoading` to fetch transactions from an API endpoint.

### Environment Configuration

- `EnvironmentConfig`: Defines the configuration for different environments (debug, release).
- `AppEnvironment`: Provides the environment-specific configuration.

### Routing

- `ListRouter`: Manages navigation within the list feature.

### Network Monitor

- `NetworkMonitor`: An `ObservableObject` class that monitors the network connection status. It utilizes `NWPathMonitor` to check for network updates and updates the `isConnected` property accordingly.

### Protocols

- `TransactionLoading`: Defines a protocol for loading transactions asynchronously.

### Extensions

- `NumberFormatter`: Provides a static method for formatting currency.
- `DateFormatter`: Provides a static method for formatting dates.
- `String`: Provides an extension for localization.

### Mocks

- `MockTransactionLoader`: A mock implementation of `TransactionLoading` for testing purposes.

## Testing

- Unit Tests: The app includes XCTest unit tests for various components to ensure the correctness of the code.
- UI Tests: I would prefer to add snapshot tests to capture and compare visual representations.

## How to Run

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or device.

## Notes

- The app supports both dark and light modes.
- Transactions are sorted by booking date in descending order.
- Categories are filtered and displayed in the picker.
- Pull-to-refresh functionality is available to reload transactions.
