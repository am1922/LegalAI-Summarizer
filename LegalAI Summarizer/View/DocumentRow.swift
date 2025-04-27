//
//  DocumentRow.swift
//  LegalAI Summarizer
//
//  Created by Артем Михайлов on 27.04.2025.
//

import SwiftUI

struct DocumentRow: View {
    let document: Document
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Название органа
            HStack {
                Text(document.organ)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                Spacer()
            }
            
            // Заголовок документа
            Text(document.title)
                .font(.body)
                .foregroundColor(.primary)
                .lineLimit(2)
                .padding(.vertical, 2)
            
            // Мета-информация
            HStack(spacing: 4) {
                Text(document.type)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(" от \(document.date)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(document.number)
                    .font(.caption.monospacedDigit())
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Image(systemName: "eye.fill")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                
                Text("\(document.views)")
                    .font(.caption.monospacedDigit())
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}
