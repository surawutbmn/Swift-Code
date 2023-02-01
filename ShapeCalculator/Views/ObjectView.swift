import SwiftUI

struct ObjectView: View {
    
    @State private var isPresentedCir: Bool = false
    @State private var isPresentedRec: Bool = false
    @State private var isPresentedTri: Bool = false
    
    var body: some View {
        
            VStack{
                Text("Select your object")
                        .font(.system(size: 40))
                        .fontWeight(.medium)
                        .foregroundColor(.purple)
                        .padding(.bottom, 80)
                
               
                HStack{
                    //circle
                    VStack{
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.yellow)
                            .padding()
                        Button("Circle"){
                            isPresentedCir.toggle()
                        }
                        .fullScreenCover(isPresented: $isPresentedCir) {
                            NavigationView{
                                CircleView()
                                        .navigationBarItems(trailing: Button("Back", action: {
                                        isPresentedCir = false
                                    }))
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                            }
                            
                        }
                        
                        .frame( maxWidth: 130, maxHeight: 40)
                        .foregroundColor(.black)
                        .background(.mint)
                        .font(.system(size: 20))
                        .cornerRadius(20)
                        //btn
                    }
                    //square
                    VStack{
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                            .padding()
                        Button("Rectangle"){
                            isPresentedRec.toggle()
                        }
                        .fullScreenCover(isPresented: $isPresentedRec) {
                            NavigationView{
                                RectangleView()
                                        .navigationBarItems(trailing: Button("Back", action: {
                                        isPresentedRec = false
                                    }))
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                            }
                            
                        }
                        
                        .frame( maxWidth: 130, maxHeight: 40)
                        .foregroundColor(.black)
                        .background(.mint)
                        .font(.system(size: 20))
                        .cornerRadius(20)
                        //btn
                    }
                  
               }//end hstack
                //triangle
                VStack{
                    Image(systemName: "triangle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                        .padding()
                    Button("Triangle"){
                        isPresentedTri.toggle()
                    }
                    .fullScreenCover(isPresented: $isPresentedTri) {
                        NavigationView{
                            TriangleView()
                                    .navigationBarItems(trailing: Button("Back", action: {
                                    isPresentedTri = false
                                }))
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                        }
                        
                    }
                    
                    .frame( maxWidth: 130, maxHeight: 40)
                    .foregroundColor(.black)
                    .background(.mint)
                    .font(.system(size: 20))
                    .cornerRadius(20)
                    //btn
                }
                    
        }
    }
}

struct ObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectView()
    }
}
