//
//  ScrumProgressViewStyle.swift
//  MeetingApp
//
//  Created by surawut binmamud on 16/10/2564 BE.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle{
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.black)
                .frame(height: 20.0)
            ProgressView(configuration)
                .frame(height: 12.0)
                .padding(.horizontal)
        }
    }
}
