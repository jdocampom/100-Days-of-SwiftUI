//
//  ContentView.swift
//  BetterRest
//
//  Created by Juan Diego Ocampo on 10/24/21.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    let maxSleepHours = 20
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    //    @State private var alertTitle = ""
    //    @State private var alertMessage = ""
    //    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                /// Tag: Enter Target Wake-up Time
                Section(header: Text("When do you want to wake up?")) {
                    HStack {
                        Text("Selected Time")
                        Spacer()
                        DatePicker("Enter the time you want to wake up.", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                }
                /// Tag: Enter Target Sleep Time
                Section(header: Text("Desired amount of sleep")) {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                /// Tag: Enter Coffee Intake
                Section(header: Text("Daily coffee intake")) {
                    HStack {
                        Text("Current")
                        // Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                        Spacer()
                        Picker("Daily coffee intake", selection: $coffeeAmount) {
                            ForEach(1...20, id: \.self) { i in
                                Text("\(i) \(i == 1 ? "cup" : "cups")")
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                /// Tag: Recommended Bedtime
                Section(header: Text("Recommended Bedtime")) {
                    HStack {
                        Spacer()
                        Text("\(calculatedBedTime)")
                            .bold()
                            .font(.largeTitle)
                            .padding(.vertical)
                            
                        Spacer()
                    }
                }
            }
            .navigationTitle("BetterRest")
            //            .toolbar {
            //                Button("Calculate", action: calculateBedtime)
            //            }
            //            .alert(alertTitle, isPresented: $showingAlert) {
            //                Button("OK") { }
            //            } message: {
            //                Text(alertMessage)
            //            }
        }
    }
    
    var calculatedBedTime: String {
        var message: String
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            do {
                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
                let sleepTime = wakeUp - prediction.actualSleep
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                message = formatter.string(from: sleepTime)
            } catch {
                message = "Error"
            }
        } catch {
            message = "Error"
        }
        return message
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
