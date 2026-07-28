//
//  Text_Dates_Demo.swift
//  TextStyles
//
//  Created by jyotirmoy_halder on 28/7/26.
//

import SwiftUI

struct Text_Dates_Demo: View {
    let eventDate = Date(timeIntervalSinceNow: 15)
    let event = Date()
    let dateInterval = DateInterval(start: Date(), end: Date(timeIntervalSinceNow: 120))
    
    var body: some View {
        Form {
            Section("Intervals") {
                Text(Date.now...Date.now.addingTimeInterval(60*60))
                Text(dateInterval)
            }
            
            Section("Relative, offset and timer styles") {
                Text("Event will occur in \(eventDate, style: .relative)")
                Text("Event will occur in \(eventDate, style: .offset)")
                Text("Event will occur in \(eventDate, style: .timer)")
            }

            Section("Format Date and Time") {
                Text(Date(), format: .dateTime)
                Text(Date(), format: .dateTime.hour())
                Text(Date(), format: .dateTime.minute())
                Text(Date(), format: .dateTime.year())
                Text(Date(), format: .dateTime.hour().minute())
                Text(Date(), format: .dateTime.minute().hour().year())
            }
        }
    }
}

#Preview {
    Text_Dates_Demo()
}
