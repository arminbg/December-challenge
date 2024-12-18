# December-challenge
hydration tracker 

# Hydration Tracker App

A simple SwiftUI app to help users track their daily water intake and stay hydrated. Users can set a daily hydration goal, log their water consumption, and monitor their progress. 

## Features

- **Set Daily Hydration Goal:** Users can input their desired daily water intake in milliliters.
- **Track Water Consumption:** Log water intake in increments of 250 ml.
- **Progress Visualization:** View consumption progress using an animated progress bar.
- **Celebrate Achievements:** Get a congratulatory alert upon meeting the hydration goal.
- **Reset Tracking:** Easily reset the water consumption log for a new day.
- **User-Friendly Interface:** Minimalistic design for effortless tracking.

## Screenshots

### Goal Setting
- Input a daily hydration goal.

### Tracking Progress
- Monitor your water consumption and progress towards the goal.

## How to Run

1. Clone the repository to your local machine:
   ```bash
   git clone <repository-url>
   ```
2. Open the project in Xcode.
3. Build and run the app on a simulator or physical device.

## Usage

1. **Set a Daily Goal:**
   - Enter your hydration goal in the input field and press "Set Goal."
   - Ensure the goal is a valid number greater than 0.

2. **Log Water Consumption:**
   - Press the "+250 ml" button to log water intake in increments of 250 ml.
   - The progress bar will update dynamically.

3. **Reset Consumption:**
   - Press the "Reset" button to clear the current water intake and start fresh.

4. **Celebrate Your Goal:**
   - Once your water intake meets or exceeds the goal, you'll receive a congratulatory message.

## Technologies Used

- **SwiftUI** for building the user interface.
- **State Management:** Using `@State` and `@FocusState` properties for UI updates and keyboard management.
- **ProgressView:** Visualizing progress towards the hydration goal.
- **Animations:** Smooth transitions when logging water consumption.

## Contributions

Contributions are welcome! Feel free to fork this repository and submit a pull request with your improvements or new features.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

Stay hydrated and happy coding!
