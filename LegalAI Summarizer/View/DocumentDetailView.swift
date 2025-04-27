//
//  DocumentDetailView.swift
//  LegalAI Summarizer
//
//  Created by Артем Михайлов on 27.04.2025.
//

import SwiftUI

struct DocumentDetailView: View {
    let document: Document
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Шапка документа
                VStack(alignment: .leading, spacing: 12) {
                    Text(document.organ)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(document.title)
                        .font(.title2.weight(.semibold))
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack(spacing: 16) {
                        Text(document.type)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("от \(document.date)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(document.number)
                            .font(.subheadline.monospacedDigit())
                            .foregroundColor(.secondary)
                        
                        
                    }
                }
                .padding(.bottom, 16)
                
                // Ключевые положения
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Ключевые положения")
                            .font(.headline)
                        
                        Spacer()
                        
                        // Кнопка "Поделиться"
                        Button(action: {
                            shareContent()
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.bottom, 4)
                    
                    ForEach(document.summary, id: \.self) { point in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 6))
                                .padding(.top, 6)
                            
                            Text(point)
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .foregroundColor(.primary)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
                
                // Полный текст
                VStack(alignment: .leading, spacing: 12) {
                    Text("Полный текст документа")
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    Text(document.content)
                        .font(.body)
                        .lineSpacing(6)
                }
                .padding(.top, 16)
            }
            .padding()
        }
        .navigationTitle("Документ")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    private func shareContent() {
        let text = document.summary.joined(separator: "\n• ")
        let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true)
        }
    }
}
