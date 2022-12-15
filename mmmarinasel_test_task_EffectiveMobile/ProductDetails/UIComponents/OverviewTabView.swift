import SwiftUI

struct OverviewTabView: View {
    var tabBarOptions: [String] = ["Shop", "Details", "Features"]
    @Binding var currentTab: Int
    @Namespace var namespace
    var body: some View {
        HStack(spacing: 30) {
            ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)),
                    id: \.0) { index, name in
                TabBarItem(currentTab: self.$currentTab,
                           namespace: namespace.self,
                           tabBarItemName: name,
                           tab: index)
            }
        }
        .padding(.horizontal, 20)
        .background(Color.white)
        .frame(height: 65)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    var tabBarItemName: String
    var tab: Int

    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                if currentTab == tab {
                    Text(tabBarItemName)
                        .foregroundColor(Color("deep_blue"))
                        .fontWeight(.medium)
                    Color("orange")
                        .frame(height: 3)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Text(tabBarItemName)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .fontWeight(.regular)
                    Color.clear.frame(height: 3)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}
