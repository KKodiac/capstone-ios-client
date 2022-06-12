//
//  CustomTextFieldStyle.swift
//  fdrone
//
//  Created by Sean Hong on 2022/06/12.
//

import Foundation
import SwiftUI

struct MyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.blue, lineWidth: 2)
        ).padding()
    }
}
