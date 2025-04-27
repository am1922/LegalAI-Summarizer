//
//  MainView.swift
//  LegalAI Summarizer
//
//  Created by Артем Михайлов on 27.04.2025.
//

import SwiftUI

struct MainView: View {
    private let documents: [Document] = [
        Document(
            organ: "Государственная дума",
            type: "Федеральный закон",
            date: "07.04.2025",
            number: "№ 71-ФЗ",
            title: "О внесении изменений в Уголовно-исполнительный кодекс Российской Федерации и Федеральный закон \"О содержании под стражей подозреваемых и обвиняемых в совершении преступлений\"",
            content: "Полный текст приказа...",
            summary: ["1", "2"],
            views: 245
        ),
        Document(
            organ: "Роспотребнадзор",
            type: "распоряжение",
            date: "20.02.2025",
            number: "№ 45-р",
            title: "О мерах профилактики COVID-19",
            content: "Полный текст распоряжения...",
            summary: ["1", "2"],
            views: 178
        )
    ]
    
//    private let documentsRegulation: [Document] = [
//        Document(
//            organ: "Государственная дума",
//            type: "Федеральный закон",
//            date: "7 апреля 2025 года",
//            number: "№ 71-ФЗ",
//            title: "О внесении изменений в Уголовно-исполнительный кодекс Российской Федерации и Федеральный закон \"О содержании под стражей подозреваемых и обвиняемых в совершении преступлений\"",
//            content: "Полный текст приказа...",
//            summary: [
//                "Установление порядка оказания медицинской помощи",
//                "Требования к квалификации медицинского персонала",
//                "Стандарты оснащения медицинских учреждений",
//                "Порядок взаимодействия между учреждениями"
//            ],
//            views: 245
//        ),
//        Document(
//            organ: "Роспотребнадзор",
//            type: "распоряжение",
//            date: "20.02.2025",
//            number: "№ 45-р",
//            title: "О мерах профилактики COVID-19",
//            content: "Полный текст распоряжения...",
//            summary: ["1", "2"],
//            views: 178
//        ),
//        Document(
//            organ: "Роспотребнадзор",
//            type: "распоряжение",
//            date: "20.02.2025",
//            number: "№ 45-р",
//            title: "О мерах профилактики COVID-19",
//            content: "Полный текст распоряжения...",
//            summary: ["1", "2"],
//            views: 178
//        )
//    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(documents) { doc in
                        NavigationLink {
                            DocumentDetailView(document: doc)
                        } label: {
                            DocumentRow(document: doc)
                        }
                        .listRowSeparatorTint(.secondary.opacity(0.3))
                    }
                } header: {
                    Text("На pravo.gov.ru недавно опубликовано(\(documents.count))")
                        .font(.subheadline .bold())
                        .foregroundColor(.primary)
                        .textCase(.none)
                        .padding(.vertical, 8)
                }
                
//                Section {
//                    ForEach(documentsRegulation) { doc in
//                        NavigationLink {
//                            DocumentDetailView(document: doc)
//                        } label: {
//                            DocumentRow(document: doc)
//                        }
//                        .listRowSeparatorTint(.secondary.opacity(0.3))
//                    }
//                } header: {
//                    Text("На regulation.gov.ru недавно опубликовано (\(documentsRegulation.count))")
//                        .font(.subheadline .bold())
//                        .foregroundColor(.primary)
//                        .textCase(.none)
//                        .padding(.vertical, 8)
//                }
                
            }
            .listStyle(.plain)
            .navigationTitle(headerTitle)
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    private var headerTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "Сегодня d MMMM"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: Date())
    }
}

#Preview {
    MainView()
}

