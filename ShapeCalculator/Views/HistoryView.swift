import SwiftUI

struct HistoryView: View {
    
    var body: some View {
        List{
            Section{
                Label("Area", systemImage: "circle.dashed")
                    .foregroundColor(.mint)
                Label("Volume", systemImage: "circle.dashed.inset.filled")
                    .foregroundColor(.mint)
            }header:{
                Text("Circle")
                    .foregroundColor(.purple)
                    .font(.system(size: 20))
    }
            
            
            Section{
                Label("Area", systemImage: "square.dashed")
                    .foregroundColor(.mint)
                Label("Volume", systemImage: "square.dashed.inset.filled")
                    .foregroundColor(.mint)
            }header:{
                Text("Rectangle")
                    .foregroundColor(.purple)
                    .font(.system(size: 20))
    }
            
            
            Section{
                Label("Area", systemImage: "triangle")
                    .foregroundColor(.mint)
                Label("Volume", systemImage: "triangle.inset.filled")
                    .foregroundColor(.mint)
            }header:{
                Text("Triangle")
                    .foregroundColor(.purple)
                    .font(.system(size: 20))
    }
            
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
