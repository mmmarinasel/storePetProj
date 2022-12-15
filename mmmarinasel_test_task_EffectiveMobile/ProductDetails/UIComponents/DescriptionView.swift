import SwiftUI

struct DescriptionView: View {
    
    let stackDescription: [String] = ["Exynos 990", "108 + 12 mp", "8 GB", "256 GB"]
    let picturesStrings: [String] = ["cpu_icon", "camera_icon", "sd_icon", "ssd_icon"]
    @State var currentTab: Int = 0
    @State var currentButtonTab: Int = 0
    @State var selectedColor: Color = Color("brown")
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
                        .background(Color("deep_blue"))
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
            ZStack(alignment: .leading) {
                OverviewTabView(currentTab: self.$currentTab)
            }
            .padding(.bottom, 10)
            HStack(spacing: 50) {
                ForEach(0..<4) { idx in
                    VStack(spacing: 10) {
                        Image(self.picturesStrings[idx])
                        Text(self.stackDescription[idx])
                            .font(Font.caption2)
                            .foregroundColor(Color("icons_gray"))
                    }
                }
            }
            .padding(.leading, 30)
            .padding(.bottom, 29)
            Text("Select color and capacity")
                .padding(.leading, 17)
                .fontWeight(.medium)
            HStack {
//                Button(action: {
//                    print("select color")
//                }) {
//
//                }
                ColorButton(color: Color("brown"), selectedColor: $selectedColor)
                ColorButton(color: Color("deep_blue"), selectedColor: $selectedColor)
                    .padding(.leading, 19)
                CapacityButton(capacity: "128 gb", currentButtonTab: $currentButtonTab, tab: 0)
                    .padding(.leading, 58)
                CapacityButton(capacity: "256 gb", currentButtonTab: $currentButtonTab, tab: 1)
            }
            .padding(.top, 15)
            .padding(.leading, 20)
            
            Button(action: {
                print("i want to buy it!!!")
            }) {
                Text("Add to cart")
                    .padding(.trailing, 61)
//                    .font(.callout)
                    .fontWeight(.bold)
                Text("$1,500.00")
                    .fontWeight(.bold)
            }
            .frame(width: 355, height: 54)
            .background(Color("orange"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.leading, 29)
            .padding(.trailing, 29)
            .padding(.top, 27)
        }
        .padding(.top, 28)
        .background(.white)
        .cornerRadius(30)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
