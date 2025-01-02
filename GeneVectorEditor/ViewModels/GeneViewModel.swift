//
//  GeneViewModel.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/2/25.
//

import Foundation
import Combine

class GeneViewModel: ObservableObject {
    @Published var genes: [Gene] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let service = GeneService()
    
    func loadGenes() {
        isLoading = true
        errorMessage = nil
        
        service.fetchGeneData { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let genes):
                    self?.genes = genes
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
