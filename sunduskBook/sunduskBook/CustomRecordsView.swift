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

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
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
                    TextField("输入你希望记忆的内容...", text: $backText)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                        .frame(height: 150) // 设置多行输入框高度
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
    }
}

#Preview {
    CustomRecordsView()
}
