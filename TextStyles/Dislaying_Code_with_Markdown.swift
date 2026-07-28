//
//  Dislaying_Code_with_Markdown.swift
//  TextStyles
//
//  Created by jyotirmoy_halder on 28/7/26.
//

import SwiftUI

struct Dislaying_Code_with_Markdown: View {
    let codeString = """
        **A SwiftUI View**
        
        `import SwiftUI`
        
        `struct Dislaying_Code_with_Markdown: View {`
            `var body: some View {`
                `Text("Hello, World!")`
            `}`
        `}`

        `#Preview {`
            `Dislaying_Code_with_Markdown()`
        `}`
        """
    var body: some View {
        Text(LocalizedStringKey(codeString))
    }
}

#Preview {
    Dislaying_Code_with_Markdown()
}
