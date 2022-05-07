//
//  GenCommentViewModel.swift
//  ToHey
//
//  Created by Jin on 2022/5/6.
//

import UIKit

class GenCommentViewModel: ObservableObject {
    @Published var comment: String = ""

    let phrases: [[String]] = NSArray(contentsOfFile: Bundle.main.path(forResource: "Phrase", ofType: "plist") ?? "") as? [[String]] ?? []

    func randomGen() {
        var comment = ""
        for phrase in phrases {
            let randomIndex = Int.random(in: 0 ..< phrase.count)
            comment += phrase[randomIndex]
        }
        self.comment = comment
    }
}
