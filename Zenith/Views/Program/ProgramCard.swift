//
//  ProgramCard.swift
//  Zenith
//
//  Created by 李伟 on 2024/9/2.
//

import SwiftUI

struct ProgramCard: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("The Basic")
                .font(.title)
                .bold()
            Text("Work with common kinds of data and write basic syntax.")
                .lineLimit(1)
        }
        .padding()
        .frame(maxWidth: 200)
    }
}

#Preview {
    ProgramCard()
}
