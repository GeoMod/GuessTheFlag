//
//  FlagModifier.swift
//  GuessTheFlag
//
//  Created by Daniel O'Leary on 10/17/19.
//  Copyright © 2019 Impulse Coupled Dev. All rights reserved.
//

import SwiftUI

struct FlagModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 80.0))
            .shadow(color: .black, radius: 2.0, x: 1, y: 2)
    }
	
}


extension View {
    func buttonStyle() -> some View {
		self.modifier(FlagModifier())
    }
}
