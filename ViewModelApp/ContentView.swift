//
//  ContentView.swift
//  ViewModelApp
//
//  Created by Florian Thiévent on 14.06.21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = ViewModel()
    let cornerSize = 4
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor:  model.hexStringToUIColor(hex: "#FFFFFF")]
        UINavigationBar.appearance().backgroundColor =  model.hexStringToUIColor(hex: "#6200EE")
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 10){
                Text("\(model.counter)").font(.system(size: 156))
                
                HStack(spacing:10){
                    EmobaButton(action: {model.increment()}, model: model, label: "increase")
                    Spacer().frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    EmobaButton(action: {model.decrement()}, model: model, label: "decrease")
                }
                
                Spacer().frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                HStack(alignment: .bottom, spacing: 50){
                    
                    Button(action: {
                        model.reset()
                    }){
                        Spacer()
                        Image(systemName: "multiply")
                            .padding()
                            .background(Color( model.hexStringToUIColor(hex: "#03DAC6")))
                            .foregroundColor(.black)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }.padding()
                }
            }
            .navigationBarTitle("\(model.title) - \(model.counter)").navigationBarHidden(false)
        }.background(Color.black)
    }
}


struct MyView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.title)
            Text("Glad to meet you.")
        }
    }
}


struct EmobaButton: View{
    
    var action: () -> Void
    @ObservedObject var model: ViewModel
    var label: String
    let cornerSize = 4
        
    var body: some View{
        Button(action: action){
            Text(label)
                .padding(10)
                .background(Color( model.hexStringToUIColor(hex: "#6200EE")))
                .font(.body)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: cornerSize, height: cornerSize)))
                .shadow(radius: 4)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

