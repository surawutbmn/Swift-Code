import SwiftUI

struct CircleView: View {
    var body: some View {
            TabView{
                CircleAreaView()
                .tabItem {
                    Image(systemName: "circle.dashed")
                    Text("Area")
                }
            //tab 2
                    CircleVolumeView()
                .tabItem {
                    Image(systemName: "circle.dashed.inset.filled")
                    Text("Volume")
                }
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
