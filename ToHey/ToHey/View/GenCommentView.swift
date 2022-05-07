//
//  GenCommentView.swift
//  ToHey
//
//  Created by Jin on 2022/5/6.
//

import SwiftUI
import UniformTypeIdentifiers
import AlertToast

struct GenCommentView: View {

    @StateObject var genTool = GenCommentViewModel()
    @State private var showToast = false

    var body: some View {
        NavigationView {
            VStack {
                Text("\(genTool.comment)").padding().onTapGesture(count: 2) {
                    let pasteboard = UIPasteboard.general
                    pasteboard.string = genTool.comment
                    showToast = true
                }
                Spacer()
                Button {
                    genTool.randomGen()
                } label: {
                    Text("Generate")
                        .frame(maxWidth: .infinity,
                               minHeight: 50,
                               alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                }.padding()
            }
            .navigationTitle("Here for you.")
        }.toast(isPresenting: $showToast) {
            AlertToast(type: .complete(Color.gray), title: "Comment copied.")
        }
    }
}

struct GenCommentView_Previews: PreviewProvider {
    static var previews: some View {
        GenCommentView()
    }
}
