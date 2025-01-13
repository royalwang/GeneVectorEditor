//
//  GeneSequenceListView 2.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/4/25.
//


import SwiftUI
import UniformTypeIdentifiers

struct GeneSequenceListView: View {
    @State private var geneFiles: [GeneFile] = [] // 动态加载的基因文件
    @State private var showAddGeneAlert: Bool = false // 控制是否显示添加基因文件的弹窗
    @State private var dragOver: Bool = false // 控制拖拽高亮效果
    @State private var isShowingDocumentPicker = false
    @State private var message: String = "" // 显示用户提示信息

    private func uploadGeneFileButton() -> some View {
        // 文件添加按钮
        Button(action: {
            isShowingDocumentPicker = true
        }) {
            HStack {
                Image(systemName: "plus")
                    .font(.headline)
                Text("Upload Gene File")
                    .font(.headline)
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .sheet(isPresented: $isShowingDocumentPicker) {
            DocumentPickerView { urls in
                self.addFiles(urls: urls)
            }
        }
    }
    
    private func addGeneFileButton() -> some View {
        // 添加基因文件按钮
        Button(action: {
            showAddGeneAlert = true // 显示添加弹窗
        }) {
            HStack {
                Image(systemName: "plus")
                Text("Add Gene File")
                    .fontWeight(.bold)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
    
    private func addPasteGeneFileButton() -> some View {
        // 文件粘贴按钮
        Button(action: {
            handleClipboardFile()
        }) {
            HStack {
                Image(systemName: "doc.on.clipboard")
                    .font(.headline)
                Text("Paste Gene File from Clipboard")
                    .font(.headline)
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Gene Files")
                .font(.title)
                .fontWeight(.bold)

            ScrollView {
                // 显示基因文件列表
                ForEach(geneFiles) { file in
                    GeneFileRow(file: file, onDelete: deleteGeneFile)
                }
            }
            
            Spacer()

            // 拖拽区域
            Text("Drag and drop files here to upload")
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(dragOver ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(dragOver ? Color.blue : Color.gray, lineWidth: 2)
                )
                .onDrop(of: [UTType.fileURL, UTType.json], isTargeted: $dragOver) { providers in
                    print("File dropped")
                    for provider in providers {
                        print("Provider supports: \(provider.registeredTypeIdentifiers)")
                    }
                    return handleFileDrop(providers: providers)
                }

            Spacer()

            addGeneFileButton()
            
            uploadGeneFileButton()
            
            addPasteGeneFileButton()
            
            // 提示信息
            if !message.isEmpty {
                Text(message)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding()
        .onAppear {
            loadGeneFiles() // 加载基因文件列表
        }
//        .onDrop(of: [UTType.fileURL], isTargeted: nil, perform: handleFileDrop) // 添加拖拽文件的支持
        .alert(isPresented: $showAddGeneAlert) {
            addGeneFileAlert()
        }
        
    }

    // 加载基因文件列表
    private func loadGeneFiles() {
        let files = GeneFileManager.shared.listGeneFiles()
        geneFiles = files.map { fileName in
            let filePath = GeneFileManager.shared.genesDirectory.appendingPathComponent(fileName)
            let attributes = try? FileManager.default.attributesOfItem(atPath: filePath.path)

            // 获取文件大小和修改时间
            let fileSize = attributes?[.size] as? Int64 ?? 0
            let formattedSize = ByteCountFormatter.string(fromByteCount: fileSize, countStyle: .file)

            let modificationDate = attributes?[.modificationDate] as? Date ?? Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            let formattedDate = dateFormatter.string(from: modificationDate)

            return GeneFile(
                name: fileName,
                size: formattedSize,
                lastModified: formattedDate,
                isCompleted: true // 假设文件已完成（示例）
            )
        }
    }

    // 删除基因文件
    private func deleteGeneFile(fileName: String) {
        GeneFileManager.shared.deleteGeneFile(fileName: fileName)
        loadGeneFiles() // 重新加载文件列表
    }

    // 添加基因文件弹窗
    private func addGeneFileAlert() -> Alert {
        Alert(
            title: Text("Add Gene File"),
            message: Text("Enter a new gene sequence to save it as a file."),
            primaryButton: .default(Text("Add"), action: {
                let newFileName = "Gene_Sequence_New.json"
                let newSequence = "ATCGTTGCAATCGTTGCAATCGTTGCA"
                GeneFileManager.shared.addGeneFile(fileName: newFileName, sequence: newSequence)
                loadGeneFiles() // 重新加载文件列表
            }),
            secondaryButton: .cancel()
        )
    }
    
    // 添加文件到列表
    private func addFiles(urls: [URL]) {
        for url in urls {
            if let fileURL = url as? URL {
                print("File URL: \(fileURL)")
                self.saveFileToSandbox(fileURL: fileURL)
            } else {
                print("Failed to get file URL")
            }
        }
    }
    
    // 处理粘贴板文件
    private func handleClipboardFile() {
//        // 检查剪贴板中是否有文件 URL
//        if let clipboardString = UIPasteboard.general.string, let fileURL = URL(string: clipboardString) {
//            print("File URL: \(fileURL)")
//            self.saveFileToSandbox(fileURL: fileURL)
//        } else {
//            print("No valid file URL found in clipboard.")
//        }
        
        let pasteboard = UIPasteboard.general

//        // 检查剪贴板是否有文本
//        if let stringContent = pasteboard.string {
//            saveClipboardContentToFile(data: Data(stringContent.utf8), fileName: "clipboard_text.txt")
//        }
//        // 检查剪贴板是否有图片
//        else if let image = pasteboard.image {
//            if let imageData = image.pngData() {
//                saveClipboardContentToFile(data: imageData, fileName: "clipboard_image.png")
//            }
//        }
        // 检查剪贴板是否有文件数据
        if let data = pasteboard.data(forPasteboardType: "public.data") {
            do {
                let decoder = JSONDecoder()
                let gene = try decoder.decode(Gene.self, from: data)
                saveClipboardContentToFile(data: data, fileName: sanitizeFileName("\(gene.name).json"))
            } catch {
                self.message = "JSON解析错误：\(error)"
                print("JSON解析错误：\(error)")
            }
        } else {
            message = "No valid content found in clipboard."
        }
    }
    
    func sanitizeFileName(_ fileName: String) -> String {
        // 使用 replacingOccurrences 来替换非法字符
        let sanitizedFileName = fileName.replacingOccurrences(of: "/", with: "_")
                                        .replacingOccurrences(of: "\\", with: "_")
        return sanitizedFileName
    }

    
    // 处理文件拖拽
    private func handleFileDrop(providers: [NSItemProvider]) -> Bool {
        for provider in providers {
            if provider.hasItemConformingToTypeIdentifier(UTType.json.identifier) {
                provider.loadItem(forTypeIdentifier: UTType.json.identifier, options: nil) { (item, error) in
                    if let error = error {
                        print("Error loading item: \(error)")
                        return
                    }
                    if let fileURL = item as? URL {
                        print("File URL: \(fileURL)")
                        self.saveFileToSandbox(fileURL: fileURL)
                    } else {
                        print("Failed to get file URL")
                    }
                }
            }
        }
        return true
    }
    
    // 保存剪贴板内容到沙盒
    private func saveClipboardContentToFile(data: Data, fileName: String) {
        do {
            let destinationDirectory = GeneFileManager.shared.genesDirectory

            // 确保目标目录存在
            GeneFileManager.shared.createGenesDirectory()
            
            // 生成文件路径（带自动重命名功能）
            let destinationURL = destinationDirectory.appendingPathComponent(fileName)
            let finalURL = generateUniqueFileName(for: destinationURL, in: destinationDirectory)

            // 写入文件
            try data.write(to: finalURL)
            print("File saved to \(finalURL.path)")
            
            DispatchQueue.main.async {
                self.loadGeneFiles()
            }
        } catch {
            print("Error saving file: \(error.localizedDescription)")
            message = "Failed to save file: \(error.localizedDescription)"
        }
    }

    // 将拖拽的文件保存到 genes 目录
    private func saveFileToSandbox(fileURL: URL) {
        let destinationDirectory = GeneFileManager.shared.genesDirectory

        // 确保目标目录存在
        GeneFileManager.shared.createGenesDirectory()

        // 生成目标文件的初始路径
        var destinationURL = destinationDirectory.appendingPathComponent(fileURL.lastPathComponent)

        // 如果文件名已存在，则生成唯一文件名
        destinationURL = generateUniqueFileName(for: destinationURL, in: destinationDirectory)

        do {
            try FileManager.default.copyItem(at: fileURL, to: destinationURL)
            print("File \(fileURL.lastPathComponent) copied to sandbox successfully.")
            DispatchQueue.main.async {
                self.loadGeneFiles()
            }
        } catch {
            print("Error copying file: \(error.localizedDescription)")
        }
    }

    // 辅助函数：生成唯一文件名
    private func generateUniqueFileName(for fileURL: URL, in directory: URL) -> URL {
        let fileManager = FileManager.default
        var uniqueURL = fileURL
        var counter = 1

        while fileManager.fileExists(atPath: uniqueURL.path) {
            // 提取文件名和扩展名
            let fileName = fileURL.deletingPathExtension().lastPathComponent
            let fileExtension = fileURL.pathExtension

            // 生成新文件名（带编号）
            let newFileName = "\(fileName) (\(counter))"
            uniqueURL = directory.appendingPathComponent(newFileName).appendingPathExtension(fileExtension)

            counter += 1
        }

        return uniqueURL
    }
    
//    // 自动重命名文件以避免冲突
//    private func generateUniqueFileName(for fileURL: URL) -> URL {
//        var uniqueURL = fileURL
//        var counter = 1
//        while FileManager.default.fileExists(atPath: uniqueURL.path) {
//            let fileName = fileURL.deletingPathExtension().lastPathComponent
//            let fileExtension = fileURL.pathExtension
//            let newFileName = "\(fileName) (\(counter))"
//            uniqueURL = fileURL.deletingLastPathComponent().appendingPathComponent(newFileName).appendingPathExtension(fileExtension)
//            counter += 1
//        }
//        return uniqueURL
//    }

    
//    private func saveFileToSandbox(fileURL: URL) {
//        let destinationURL = GeneFileManager.shared.genesDirectory.appendingPathComponent(fileURL.lastPathComponent)
//        print("Source File URL: \(fileURL)")
//        print("Destination File URL: \(destinationURL)")
//        
//        do {
//            GeneFileManager.shared.createGenesDirectory()
//            try FileManager.default.copyItem(at: fileURL, to: destinationURL)
//            print("File \(fileURL.lastPathComponent) copied to sandbox successfully.")
//            DispatchQueue.main.async {
//                self.loadGeneFiles()
//            }
//        } catch {
//            print("Error copying file: \(error.localizedDescription)")
//        }
//    }
    
}


//// 基因文件管理器（从之前的实现中导入）
//struct GeneFileManager {
//    static let shared = GeneFileManager()
//
//    var genesDirectory: URL {
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        return documentsDirectory.appendingPathComponent("genes")
//    }
//
//    func createGenesDirectory() {
//        do {
//            if !FileManager.default.fileExists(atPath: genesDirectory.path) {
//                try FileManager.default.createDirectory(at: genesDirectory, withIntermediateDirectories: true, attributes: nil)
//            }
//        } catch {
//            print("Error creating genes directory: \(error)")
//        }
//    }
//
//    func addGeneFile(fileName: String, sequence: String) {
//        createGenesDirectory()
//        let fileURL = genesDirectory.appendingPathComponent(fileName)
//        do {
//            try sequence.write(to: fileURL, atomically: true, encoding: .utf8)
//        } catch {
//            print("Error writing gene file: \(error)")
//        }
//    }
//
//    func deleteGeneFile(fileName: String) {
//        let fileURL = genesDirectory.appendingPathComponent(fileName)
//        do {
//            if FileManager.default.fileExists(atPath: fileURL.path) {
//                try FileManager.default.removeItem(at: fileURL)
//            }
//        } catch {
//            print("Error deleting file: \(error)")
//        }
//    }
//
//    func listGeneFiles() -> [String] {
//        do {
//            return try FileManager.default.contentsOfDirectory(atPath: genesDirectory.path)
//        } catch {
//            print("Error listing gene files: \(error)")
//            return []
//        }
//    }
//}
//
//// 预览
//struct GeneSequenceListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GeneSequenceListView()
//    }
//}
