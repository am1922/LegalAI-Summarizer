//
//  Model.swift
//  LegalAI Summarizer
//
//  Created by Артем Михайлов on 27.04.2025.
//

import Foundation

struct Document: Identifiable, Hashable {
    let id = UUID()
    let organ: String
    let type: String
    let date: String
    let number: String
    let title: String
    let content: String
    let views: Int
}
