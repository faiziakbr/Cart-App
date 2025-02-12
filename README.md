# iOS Cart App

An iOS application that fetches and displays products from [DummyJSON API](https://dummyjson.com/) using `UITableView` with pagination. The app follows MVVM architecture with Clean Architecture principles and uses `Combine` for API handling. Users can search for products by title, refresh the list with swipe-to-refresh, and view product details in a SwiftUI-based detail screen.

## Video Link
https://drive.google.com/file/d/19_JcUGkitVAcTtt7X_QhVZpPSz3RODHH/view?usp=sharing

## Features

- **Product Listing**: Displays a list of products using `UITableView`.
- **Pagination**: Fetches products in chunks to improve performance.
- **Search**: Users can search products by title.
- **Swipe to Refresh**: Allows users to refresh the product list.
- **Product Details**: Clicking a product navigates to a SwiftUI-based detail screen.

## Technologies Used

- **UIKit**: For building the main UI components.
- **SwiftUI**: Used for the product detail screen.
- **Combine**: For handling API calls reactively.
- **MVVM + Clean Architecture**: Ensures separation of concerns.
- **URLSession**: For networking.

## API Used

- **Base URL**: `https://dummyjson.com`
- **Endpoints**:
  - Get products: `GET /products?limit={limit}&skip={skip}`

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/faiziakbr/Cart-App
   cd CartApp
   ```
2. Open `CartApp.xcodeproj` in Xcode.
3. Build and run the app on a simulator or device.
## How It Works

### Product Listing
- Fetches products using `Combine` and displays them in `UITableView`.
- Implements pagination to load more products when scrolling.

### Searching Products
- Uses the search API to filter products by title.

### Swipe to Refresh
- Pulling down on the list triggers a refresh of products.

### Product Details
- Tapping a product navigates to a SwiftUI view showing detailed information.

## Requirements

- iOS 15.6+
- Xcode 15+

