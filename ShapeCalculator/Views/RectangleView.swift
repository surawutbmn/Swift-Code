import SwiftUI

struct RectangleView:View {
    var body: some View {
        
        TabView{
            RectangleArea()
            .tabItem {
                Image(systemName: "square.dashed")
                Text("Area")
            }
        //tab 2
                RectangleVolume()
            .tabItem {
                Image(systemName: "square.dashed.inset.filled")
                Text("Volume")
            }
    }
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
