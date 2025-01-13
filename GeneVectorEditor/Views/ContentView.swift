////
////  ContentView.swift
////  GeneVectorEditor
////
////  Created by Wang Zhengdong on 1/2/25.
////
//
//import SwiftUI
//
//struct ContentView2: View {
//    @StateObject private var viewModel = GeneViewModel()
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                if viewModel.isLoading {
//                    ProgressView("加载中...")
//                        .progressViewStyle(CircularProgressViewStyle())
//                } else {
//                    if let errorMessage = viewModel.errorMessage {
//                        Text("错误: \(errorMessage)")
//                            .foregroundColor(.red)
//                    } else {
//                        List(viewModel.genes) { gene in
//                            NavigationLink(destination: FileDetailPage3(gene: gene)) {
//                                GeneCellView(gene: gene)
//                            }
//                        }
//                    }
//                }
//            }
//            .onAppear {
//                viewModel.loadGenes()
//            }
//            .navigationTitle("基因序列")
//        }
//    }
//}
//
//
//#Preview {
//    ContentView2()
//}
//
