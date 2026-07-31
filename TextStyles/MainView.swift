//
//  MainView.swift
//  TextStyles
//
//  Created by jyotirmoy_halder on 31/7/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Acrostic Poems") {
                    AcrosticPoemView()
                }
                NavigationLink("Markdown") {
                    Markdown_Demo()
                }
                NavigationLink("Markdown and String Interpolation") {
                    Markdown_and_String_Interpolation_Demo()
                }
                NavigationLink("Markdow and Code") {
                    Displaying_Code_with_Markdown()
                }
                NavigationLink("OpenURLAction") {
                    OpenURLAction_Demo()
                }
                NavigationLink("Pluraliation and Inflection") {
                    Pluralization_Demo()
                }
                NavigationLink("List, MmeberStyle and Measurements") {
                    List_MemberStyle_Measurements_Demo()
                }
                NavigationLink("Dates and the Text View") {
                    Text_Dates_Demo()
                }
                NavigationLink("Attributed String") {
                    Attributed_String_Demo()
                }
            }
            .navigationTitle("Style and Text View")
        }
    }
}

#Preview {
    MainView()
}
