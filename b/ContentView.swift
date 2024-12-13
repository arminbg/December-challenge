import SwiftUI

struct ContentView: View {
    @State private var dailyGoalText: String = "" // String for TextField input
    @State private var dailyGoal: Int? = nil // Optional Int for the goal
    @State private var consumed: Int = 0 // Tracks water consumed
    @FocusState private var isGoalFieldFocused: Bool // To manage keyboard dismissal
    @State private var showCongrats: Bool = false // Tracks if the goal is met

    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Hydration Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            if let dailyGoal = dailyGoal, dailyGoal > 0 {
                // Goal is set: Show the tracker
                VStack(spacing: 20) {
                    // Display the daily goal
                    Text("Daily Goal: \(dailyGoal) ml")
                        .font(.headline)

                    // Display the amount consumed
                    Text("Consumed: \(consumed) ml")
                        .font(.title)
                        .foregroundColor(consumed >= dailyGoal ? .green : .blue)

                    // Progress bar with animation
                    ProgressView(value: Double(consumed), total: Double(dailyGoal))
                        .progressViewStyle(LinearProgressViewStyle(tint: consumed >= dailyGoal ? .green : .blue))
                        .padding()
                        .animation(.easeInOut, value: consumed)

                    // Button to log water consumption
                    Button(action: {
                        if consumed + 250 >= dailyGoal {
                            consumed = dailyGoal // Cap at daily goal
                            showCongrats = true
                        } else {
                            consumed += 250 // Add 250 ml per press
                        }
                    }) {
                        Text("+ 250 ml")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(consumed >= dailyGoal ? Color.green : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()

                    // Reset button
                    Button(action: {
                        consumed = 0 // Reset the consumption
                        showCongrats = false
                    }) {
                        Text("Reset")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                }
            } else {
                // No goal set: Prompt user to input a goal
                VStack(spacing: 20) {
                    Text("Set Your Daily Hydration Goal")
                        .font(.headline)

                    TextField("Daily Goal (ml)", text: $dailyGoalText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .focused($isGoalFieldFocused) // Manage keyboard focus
                        .frame(width: 150)
                        .padding()

                    Button("Set Goal") {
                        if let goal = Int(dailyGoalText), goal > 0 {
                            dailyGoal = goal // Set the goal
                            isGoalFieldFocused = false // Dismiss the keyboard
                        } else {
                            dailyGoalText = "" // Clear invalid input
                        }
                    }
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .alert("Well done! You are well hydrated.", isPresented: $showCongrats, actions: {
            Button("OK", role: .cancel) {}
        })
        .onTapGesture {
            isGoalFieldFocused = false // Dismiss keyboard on tap outside
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



