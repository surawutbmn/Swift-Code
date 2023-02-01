import SwiftUI

struct TriangleView: View {
    var body: some View {
        TabView{
            TriangleArea()
            .tabItem {
                Image(systemName: "triangle")
                Text("Area")
            }
        //tab 2
            TriangleVolume()
            .tabItem {
                Image(systemName: "triangle.inset.filled")
                Text("Volume")
            }
    }
    }
}

struct TriangleView_Previews: PreviewProvider {
    static var previews: some View {
        TriangleView()
    }
}
