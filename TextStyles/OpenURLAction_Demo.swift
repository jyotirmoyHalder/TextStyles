//
//  OpenURLAction_Demo.swift
//  TextStyles
//
//  Created by jyotirmoy_halder on 28/7/26.
//

import SwiftUI

struct OpenURLAction_Demo: View {
    let fontAwesome = "*[Font awesome](https://fontawesome.com/search?m=free&o=r)*"
    @State private var visits = 0
    let maxVisits = 4 // Should be at least three
    
    var visitMe: String {
        switch(visits) {
        case 0: return "Check out \(fontAwesome) for some great fonts."
        case 1: return "Glad you are using \(fontAwesome)"
        case 2: return "Using \(fontAwesome)? Please leave a review."
        case 3...maxVisits: return "\(fontAwesome)"
        default:
            return "No more font awesome, let's get back to coding."
        }
    }
    
    @State private var actOfKindnessURLFromGoogle =
    "*[Acts Of Kindness](https://www.google.com/search?sca_esv=84d4dc266ee70f6a&sxsrf=APpeQnuwaVXgNmyI9zW4J0FXkaEJrCB0gg:1785221442399&udm=2&fbs=ABfTbFVyMZGZf1hfvX9uKjN_-G8c4u0nXx4bEIpwm1lnNH832cSpkWkfSwsmpNIrD_OQ-UdFAe4qAwsQWVbrtprjzBSpOVgNo3C1qvLT8VSPplEbZXaaJNEHI6qeAjOCW2ooD7yzDEDNihyLt_tfqKNg1JQ2O-L0ahKEGYiYPHXtq9izQPbW8fEkYh9ianSGgOvyOfBU38I6tJdeS-V8GPtLz2vqWe8vfQ&q=act+of+kindness&sa=X&ved=2ahUKEwikma2P5PSVAxW_yDgGHUkzJrcQtKgLegQIGRAB&biw=1512&bih=776&dpr=2)*"
    
    @State private var actOfKindnessURL = "*[Another Act of Kindness](https://www.randomactsofkindness.org/)*"
    @State private var showAlert = false
    var body: some View {
        Form {
            Text(LocalizedStringKey(visitMe))
                .environment(\.openURL, OpenURLAction{ url in
                    visits += 1
                    return .systemAction
                })
            
            Text(LocalizedStringKey(actOfKindnessURLFromGoogle))
                .environment(\.openURL, OpenURLAction(handler: { url in
                    if url.absoluteString.contains("google") {
                        print("The site 'google has been blocked.")
                        showAlert = true
                        return .handled
                        // Prevent opening this URL
                    } else {
                        return .systemAction
                    }
                }))
                .tint(.red)
            
            Text(LocalizedStringKey(actOfKindnessURL))
                .environment(\.openURL, OpenURLAction(handler: { url in
                    if url.absoluteString.count < 12 || url.absoluteString.contains("bit.ly") {
                        print("suspicious email")
                        return .discarded
                    } else if visits < 2 {
                        return .handled
                    } else if visits == 2 , let url = URL(string: "https://www.udemy.com/course/the-complete-ios-developer-course-with-swift/?couponCode=26BBPAA2MX") {
                        return .systemAction(url)
                    } else {
                        return .systemAction
                    }
                }))
                .tint(.green)
        }
        .tint(.secondary)
        .bold()
        .foregroundStyle(.blue)
        .font(.title)
        .alert("Google is Blocked", isPresented: $showAlert) {
            Button("Ok", role: .cancel) {}
        }
        .onChange(of: showAlert) { oldValue, newValue in
            print("Alert value: \(showAlert.description)")
        }
    }
}

#Preview {
    OpenURLAction_Demo()
}
