//
//  Markdown_Demo.swift
//  TextStyles
//
//  Created by jyotirmoy_halder on 28/7/26.
//

import SwiftUI

struct Markdown_Demo: View {
    let favoriteWebsites = """
            ***My Favorite Website***
            ___My Favorite Website___
        
        Here are some of my favorite websites for learning and exploring:
        
        1. **[Figma](https://figma.com/)**: A collaborative interface design tool for teams to create, prototype, and collaborate on digital designs in real time.
        2. *[Laws of UX](https://lawsofux.com/)*: A collection of principles that describe how users interact with interfaces, guiding designers to creae more effective and intuitive user experiences.
        3. ***[Pexels](https://www.pexels.com/)***: A platform offering free stock photos, videos, and music that can be used for personal and commercial projects without attribution.
        
        ~~Feel free to check them out!~~
        """;
    var body: some View {
        Text(LocalizedStringKey(favoriteWebsites))
        .tint(.red)
        .foregroundStyle(.blue)
        .padding()
    }
}

#Preview {
    Markdown_Demo()
}
