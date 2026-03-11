//
//  ContentView.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 24.02.2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var activeTab: TabModel = .home
    @State private var isTabBarHidden: Bool = false
    @State private var notes: [LibraryItem] = [
        LibraryItem(name: "The First NOTE", type: ItemType.note, lastOpened: .now),
        LibraryItem(name: "The Second NOTE", type: ItemType.note, lastOpened: .now),
        LibraryItem(name: "The Third NOTE", type: ItemType.folder, lastOpened: .now),
        LibraryItem(name: "The Third NOTE", type: ItemType.folder, lastOpened: .now)
    ]
    var body: some View{
        ZStack(alignment: .bottom){
            if #available(iOS 18, *){
                TabView(selection: $activeTab){
                    Tab.init(value: .home){
                        MainView(notes: $notes)
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                    Tab.init(value: .profile){
                        Text("Home")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                    Tab.init(value: .search){
                        Text("Home")
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                }
            } else {
                TabView(selection: $activeTab){
                    HomeView()
                        .tag(TabModel.home)
                        .toolbar(.hidden, for: .tabBar)
                        .background{
                            if !isTabBarHidden {
                                HideTabBar {
                                    print("native tab bar is hiddent")
                                    isTabBarHidden = true
                                }
                            }
                        }
                    Text("Profile")
                        .tag(TabModel.profile)
                        .toolbar(.hidden, for: .tabBar)
                }
                .overlay{
                    Button {
                        activeTab = activeTab == .home ? .profile : .home
                    } label: {
                        Text("switch tabs")
                    }
                    .offset(y: 100)
                }
            }
            CustomTabBar(activeTab: $activeTab)
        }
    }
}

struct HomeView: View{
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 12){
                    ForEach(1...15, id: \.self){ _ in
                            RoundedRectangle(cornerRadius: 12)
                            .fill(.background)
                            .frame(height: 50)
                    }
                }
                .padding(15)
            }
            .navigationTitle("FLOATING Tab Bar")
            .background(Color.primary.opacity(0.07))
        }
    }
}

struct HideTabBar: UIViewRepresentable {
    var result: () -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let tabController = view.tabController {
                tabController.tabBar.isHidden = true
                result()
            }
        }
        
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

extension UIView {
    var tabController: UITabBarController? {
        if let controller = sequence(first: self, next: {
            $0.next
        }).first(where: { $0 is UITabBarController}) as? UITabBarController {
            return controller
        }
        
        return nil
    }
}

#Preview("iPhone 15 Pro") {
    ContentView()
}
