# FetchCC

Fetch - iOS Coding Challenge 

Submission by Davy Chuon

Objective:
Please write a native iOS app that allows users to browse recipes using the
following API: https://themealdb.com/api.php

There are 2 endpoints that your app should utilize:
• https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the
list of meals in the Dessert category.
• https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching
the meal details by its ID.

The user should be shown the list of meals in the Dessert category, sorted
alphabetically.

When the user selects a meal, they should be taken to a detail view that
includes:
• Meal name
• Instructions
• Ingredients/measurements


Submission Details:
- The project is currently compatible with a minimum deployment of iOS 15 and was developed/tested within Xcode version 15.0.
- Only Apple's frameworks were used so there is no concern of 3rd party dependecies.
- The UI is implemented completely in SwiftUI and follows an MVVM design pattern.

Potential Improves:
- Incorporating a better architecture overall such as implementing coordinators to abstract navigation from the views
- Implementing states to better manage behaviors based on certain states of the app
- Improving on the current ErrorHandler in place to be more prominent and flexible
- Adding test cases to identify and handle any edge cases
- Including an empty state (no data or no wifi) view
