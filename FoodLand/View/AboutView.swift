//
//  AboutView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/2/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    @State var isAbout: Bool = false
    @State private var showGreeting = true
    @State private var fromTime = Date()
    @State private var toTime = Date()
    
    var body: some View {
        VStack {
            Toggle(isOn: $showGreeting) {
                Text("Show welcome message")
            }.padding()
            if showGreeting {
                Form {
                    Section {
                        DatePicker("Start", selection: $fromTime, displayedComponents: .hourAndMinute)
                        DatePicker("Finish", selection: $toTime, displayedComponents: .hourAndMinute)
                    }
                }
            }
            
            Spacer()
            Button(action: {
            }, label: {
                Text("Tappped for more information about us")
                    .simultaneousGesture(TapGesture().onEnded {
                        self.isAbout.toggle()
                    })
            }) // Button
            NavPopButton(destination: .root) {
                Text("Pop to Root")
                    .foregroundColor(.green)
                    .padding(.top, 20)
            } // NavPopButton
            Spacer()
        } //VStack
            .sheet(isPresented: $isAbout, onDismiss: {
                print("Close Modal")
            }) {
                AboutViewModal()
        }
    }
    
    func changeTimeFrom() {
        let calendar = Calendar.current.dateComponents([.hour, .minute], from: fromTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.timeFormat
        let stringDate = "\(calendar.hour!):\(calendar.minute!)"
        let selectedDate: Int = stringDate.convertToSecondsInt()
        
//        SharedPreferences().fromTime = selectedDate
    }
    
    func changeTimeTo() {
            let calendar = Calendar.current.dateComponents([.hour, .minute], from: toTime)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Constants.timeFormat
            let stringDate = "\(calendar.hour!):\(calendar.minute!)"
            let selectedDate: Int = stringDate.convertToSecondsInt()
            
//            SharedPreferences().toTime = selectedDate
        }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
