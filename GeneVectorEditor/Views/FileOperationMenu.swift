////
////  FileOperationMenu.swift
////  GeneVectorEditor
////
////  Created by Wang Zhengdong on 1/2/25.
////
//
//import SwiftUI
//
//struct FileOperationMenu: View {
//    @State private var selectedTab: String = "General"
//    @State private var isEditable: Bool = true
//    @State private var isMaterialAvailable: Bool = true
//    @State private var description: String = ""
//    @State private var history: String = ""
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // 文件操作菜单标签
//                Picker("Choose Operation", selection: $selectedTab) {
//                    Text("General").tag("General")
//                    Text("Features").tag("Features")
//                    Text("Parts").tag("Parts")
//                    Text("Primers").tag("Primers")
//                    Text("Translations").tag("Translations")
//                    Text("Cut Sites").tag("Cut Sites")
//                    Text("ORFs").tag("ORFs")
//                    Text("Genbank").tag("Genbank")
//                    Text("Manage Enzymes").tag("Manage Enzymes")
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding()
//
//                // 根据选择的标签展示不同内容
//                switch selectedTab {
//                case "General":
//                    GeneralView(isEditable: $isEditable, isMaterialAvailable: $isMaterialAvailable, description: $description, history: $history)
//                case "Features":
//                    FeaturesView()
//                case "Parts":
//                    PartsView()
//                case "Primers":
//                    PrimersView()
//                case "Translations":
//                    TranslationsView()
//                case "Cut Sites":
//                    CutSitesView()
//                case "ORFs":
//                    ORFsView()
//                case "Genbank":
//                    GenbankView()
//                case "Manage Enzymes":
//                    ManageEnzymesView()
//                default:
//                    Text("Select an operation")
//                }
//            }
//            .navigationBarTitle("File Operations", displayMode: .inline)
//        }
//    }
//}
//
//// MARK: - General Section View
//struct GeneralView: View {
//    @Binding var isEditable: Bool
//    @Binding var isMaterialAvailable: Bool
//    @Binding var description: String
//    @Binding var history: String
//    
//    var body: some View {
//        Form {
//            Section(header: Text("General Information")) {
//                TextField("Name", text: $description)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Toggle("Circular/Linear", isOn: $isEditable)
//                Toggle("Material Availability", isOn: $isMaterialAvailable)
//                TextField("Length", text: .constant("5570"))
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Toggle("Is Editable", isOn: $isEditable)
//                TextField("Description", text: $description)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                TextField("History", text: $history)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            }
//        }
//    }
//}
//
//// MARK: - Features Section View
//struct FeaturesView: View {
//    var body: some View {
//        Form {
//            Section(header: Text("Features")) {
//                TextField("Name", text: .constant(""))
//                TextField("Type", text: .constant(""))
//                ColorPicker("Color", selection: .constant(Color.blue))
//                TextField("Size", text: .constant("1000"))
//                Toggle("Strand", isOn: .constant(true))
//            }
//        }
//    }
//}
//
//// MARK: - Parts Section View
//struct PartsView: View {
//    var body: some View {
//        Form {
//            Section(header: Text("Parts")) {
//                TextField("Name", text: .constant(""))
//                TextField("Size", text: .constant("200"))
//                TextField("Tags", text: .constant(""))
//                Toggle("Strand", isOn: .constant(true))
//            }
//        }
//    }
//}
//
//// MARK: - Primers Section View
//struct PrimersView: View {
//    var body: some View {
//        Form {
//            Section(header: Text("Primers")) {
//                TextField("Name", text: .constant(""))
//                TextField("Bases", text: .constant("ATGC"))
//                TextField("Size", text: .constant("50"))
//                Toggle("Strand", isOn: .constant(true))
//            }
//        }
//    }
//}
//
//// MARK: - Translations Section View
//struct TranslationsView: View {
//    var body: some View {
//        Form {
//            Section(header: Text("Translations")) {
//                TextField("Type", text: .constant("CDS"))
//                TextField("Size (aa)", text: .constant("150"))
//                TextField("Mass (g/mol)", text: .constant("12345"))
//                Toggle("Strand", isOn: .constant(true))
//            }
//        }
//    }
//}
//
//// MARK: - Cut Sites Section View
//struct CutSitesView: View {
//    var body: some View {
//        Form {
//            Section(header: Text("Cut Sites")) {
//                TextField("Name", text: .constant("EcoRI"))
//                TextField("Number of Cuts", text: .constant("2"))
//                TextField("Groups", text: .constant("Group 1"))
//            }
//        }
//    }
//}
//
//// MARK: - ORFs Section View
//struct ORFsView: View {
//    var body: some View {
//        Form {
//            Section(header: Text("ORFs")) {
//                ColorPicker("Color", selection: .constant(Color.blue))
//                TextField("Size (aa)", text: .constant("500"))
//                TextField("Size", text: .constant("1000"))
//                TextField("Frame", text: .constant("Frame 1"))
//                Toggle("Strand", isOn: .constant(true))
//            }
//        }
//    }
//}
//
//// MARK: - Genbank Section View
//struct GenbankView: View {
//    var body: some View {
//        Text("Genbank data management.")
//    }
//}
//
//// MARK: - Manage Enzymes Section View
//struct ManageEnzymesView: View {
//    var body: some View {
//        Form {
//            Section(header: Text("Manage Enzymes")) {
//                TextField("Enzyme Groups", text: .constant("Group 1"))
//                Toggle("Hidden", isOn: .constant(true))
//            }
//        }
//    }
//}
//
//// MARK: - Preview
//struct FileOperationMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        FileOperationMenu()
//    }
//}
