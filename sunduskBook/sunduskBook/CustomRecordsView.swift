//
//  CustomRecordsView.swift
//  sunduskBook
//
//  Created by IosDeveloper on 2024/7/15.
//
import SwiftUI

struct CustomRecordsView: View {
    @State private var frontText: String = ""
    @State private var backText: String = ""
    @State private var showAlert = false
    @EnvironmentObject var viewModel: CardsViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                HStack {
                    Spacer()
                    Button(action: {
                        // 保存按钮操作
                        viewModel.addCard(title: frontText, content: backText)
                        frontText = ""
                        backText = ""
                        showAlert = true
                    }) {
                        Text("保存")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(5)
                            .frame(width: 60) // 修改按钮框的宽度
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                    .disabled(frontText.isEmpty || backText.isEmpty) // 添加按钮启用条件
                    .padding(.trailing, 20) // 按钮距离右边缘20像素
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("保存成功"), message: Text("您的记录已保存。"), dismissButton: .default(Text("确定")))
                    }
                }

                // 卡片正面
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("卡片正面")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            // 操作按钮
                        }) {
                            Text("可选")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(5)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(5)
                        }
                        Button(action: {
                            // 相机按钮操作
                        }) {
                            Image(systemName: "camera")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    Text("提示问题")
                        .foregroundColor(.gray)
                    TextField("请输入内容", text: $frontText)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.horizontal)

                // 卡片背面
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("卡片背面")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            // 操作按钮
                        }) {
                            Text("可选")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(5)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(5)
                        }
                        Button(action: {
                            // 相机按钮操作
                        }) {
                            Image(systemName: "camera")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    TextView(text: $backText)
                        .frame(height: 150) // 设置多行输入框高度
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.horizontal)
            }
            .navigationTitle("记录")
            .background(Color.white)
            .background(Color(UIColor.systemGroupedBackground))
        }
        .padding(.bottom, 50) // 添加底部内边距以防止键盘遮挡
        .modifier(HideKeyboardOnTap())
    }
}

// 自定义 TextView 组件
struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.delegate = context.coordinator
        textView.backgroundColor = UIColor.systemGray6
        textView.layer.cornerRadius = 5
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextView

        init(_ parent: TextView) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}

// 自定义 ViewModifier，用于隐藏键盘
struct HideKeyboardOnTap: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.clear)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

#Preview {
    CustomRecordsView().environmentObject(CardsViewModel())
}
