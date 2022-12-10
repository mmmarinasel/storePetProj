import SwiftUI

struct OverviewTab0: View {
    var body: some View {
        Color.yellow
            .opacity(0.2)
            .edgesIgnoringSafeArea(.all)
    }
}

struct OverviewTab1: View {
    var body: some View {
        Color.red
            .opacity(0.2)
            .edgesIgnoringSafeArea(.all)
    }
}

struct OverviewTab2: View {
    var body: some View {
        Color.green
            .opacity(0.2)
            .edgesIgnoringSafeArea(.all)
    }
}

struct OverviewTabView: View {
    var tabBarOptions: [String] = ["Shop", "Details", "Features"]
    @Binding var currentTab: Int
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)),
                        id: \.0) { index, name in
                    TabBarItem(currentTab: self.$currentTab, tabBarItemName: name, tab: index)
                }
            }
            .padding(.horizontal, 60)
        }
        .background(Color.white)
        .frame(height: 80)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarItemName: String
    var tab: Int
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.black
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}

//struct OverviewTab_Previews: PreviewProvider {
//    static var previews: some View {
//        OverviewTab()
//    }
//}
