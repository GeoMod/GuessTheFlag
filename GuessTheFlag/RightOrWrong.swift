//
//  RightOrWrong.swift
//  GuessTheFlag
//
//  Created by Daniel O'Leary on 10/27/19.
//  Copyright © 2019 Impulse Coupled Dev. All rights reserved.
//

import SwiftUI

struct RightOrWrong: View {
	var text: String
    var body: some View {
        Text(text)
			.font(.headline)
			.foregroundColor(Color.black)
		
    }
}

struct RightOrWrong_Previews: PreviewProvider {
    static var previews: some View {
		RightOrWrong(text: "👍🏻")
			
    }
}
