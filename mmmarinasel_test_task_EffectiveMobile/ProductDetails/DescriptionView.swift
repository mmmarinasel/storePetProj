import SwiftUI

struct DescriptionView: View {
    
    let addToFavsButtonColor = Color(UIColor(red: 1 / 255,
                                         green: 0,
                                         blue: 53 / 255,
                                         alpha: 1))
    @State var currentTab: Int = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack(spacing: 40) {
                Text("Galaxy Note 20 Ultra")
                    .padding(.leading, 17)
                    .font(.title)
                    .fontWeight(.medium)
                Button(action: {
                    print("BUY!!!")
                }) {
                    Image("icons8-favorite-40")
                        .background(self.addToFavsButtonColor)
                        .cornerRadius(10)
                }
                .padding(.trailing, 17)
            }
            HStack {
                ForEach(1..<6) { i in
                    Button(action: {
                        print("wow")
                    }) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .padding(.leading, 17)
            ZStack(alignment: .top) {
                TabView(selection: self.$currentTab) {
                    OverviewTab0().tag(0)
                    OverviewTab1().tag(1)
                    OverviewTab2().tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                
                OverviewTabView(currentTab: self.$currentTab)
            }
        }
        .cornerRadius(30)
//            .background(.red)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
