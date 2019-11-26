//
//  tankaList.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/11/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import Foundation

// MARK: - Tankalist
class Tankalist: Codable {
    let tankaid, sectionid: Int
    let phrase: [String: String]
    let userid: [String: Int]
    let date: [String: String]
    let taglist: [String]
    let background, wordcolor: String

    init(tankaid: Int, sectionid: Int, phrase: [String: String], userid: [String: Int], date: [String: String], taglist: [String], background: String, wordcolor: String) {
        self.tankaid = tankaid
        self.sectionid = sectionid
        self.phrase = phrase
        self.userid = userid
        self.date = date
        self.taglist = taglist
        self.background = background
        self.wordcolor = wordcolor
    }
}

