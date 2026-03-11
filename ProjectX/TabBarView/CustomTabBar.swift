//
//  CustomTabBar.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 26.02.2026.
//

import SwiftUI

struct CustomTabBar: View {
    var activeForeground: Color = .white
    var activeBackground: Color = .blue
    @Binding var activeTab: TabModel
    @Namespace private var animation
    var body: some View {
        let status = activeTab == .home || activeTab == .profile
        
        HStack(spacing: !status ? 0 : 12){
            HStack(spacing: 0){
                ForEach(TabModel.allCases, id: \.rawValue) { tab in
                    Button{
                        activeTab = tab
                    } label: {
                        HStack(spacing: 5){
                            Image(systemName: tab.rawValue)
                                .font(.title3.bold())
                                .frame(width: 30, height: 30)
                            
                            if(activeTab == tab){
                                Text(tab.title)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                
                            }
                        } // HStack finish
                        .foregroundStyle(activeTab == tab ? activeForeground : .gray)
                        .padding(.vertical, 2)
                        .padding(.leading, 10)
                        .padding(.trailing, 15)
                        .contentShape(.rect)
                        .background{
                            if(activeTab == tab){
                                Capsule()
                                    .fill(activeBackground.gradient)
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 5)
            .frame(height: 45)
            .background(
                .background
                    .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                    .shadow(.drop(color: .black.opacity(0.06), radius: 5, x: -5, y: -5)),
                in: .capsule
            )
            .zIndex(10)
            
            Button {
                if(activeTab == .home){
                    print("MAIN")
                } else {
                    print("SETTINGS")
                }
            } label: {
                MorphingSymbolView(
                    symbol: activeTab == .home ? "person.fill" : "mic.fill",
                    config: .init(
                        font: .title3,
                        frame: .init(width: 42, height: 42),
                        radius: 2,
                        foregroundColor: activeForeground,
                        keyFrameDuration: 0.3,
                        symbolAnimation: .smooth(duration: 0.3, extraBounce: 0)
                    ))
                .background(activeBackground.gradient)
                .clipShape(.circle)
            }
            .allowsHitTesting(status)
            .offset(x: status ? 0 : -20)
            .padding(.leading, status ? 0 : -42)
        }
        .padding(.bottom, 5)
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}

#Preview {
    ContentView()
}
