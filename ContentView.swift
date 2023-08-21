//
//  ContentView.swift
//  iFlood
//
//  Created by Spencer Sisters on 8/27/21.
//
/*ZStack {
    if !self.menuOpen {
        Button(action: {
            self.openMenu()//button action
        }, label: {
            Text("Menu")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(25)
                .padding(5)
                .shadow(radius: 5)
                //.border(Color.green, width: 5)
                //.overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.green, lineWidth: 5))
        })
        .offset(x:0, y:-300)//moves the menu button
        //what the button looks like
    }
    
    SideMenu(width: 200,
             height: 100,
             isOpen: self.menuOpen,
             menuClose: self.openMenu)
    }*/
import SwiftUI
import MapKit

/*struct ContentView: View {
    //@State var menuOpen: Bool = false
    var body: some View {
        NavigationView {
            VStack{
                Text("iFlood")//.bold()
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                /*Text("Integrated Flood Forecast System").bold()
                    .font(.subheadline)
                    .foregroundColor(.white)
               */ Spacer()
                NavigationLink(destination: AboutView()){
                    Text("About")
                        //.frame(minWidth: 50, maxWidth: 100)
                        .padding()
                        .foregroundColor(.black)
                        .cornerRadius(40)
                        .font(.title)
                }
            }
        }
    }
    
    //func openMenu() {
      //  self.menuOpen.toggle()
   // }
}*/

struct ContentView : View {
    var body: some View {
        NavigationView {
            ZStack{
                    Image("map")//background image
                        .opacity(0.25)
                    VStack {
                            Text("iFlood")
                                .font(.largeTitle)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                            Text("Integrated Flood Forecasting System")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(Color.black)
                            Text("Developing the next generation of total water ")
                                    .font(.body)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                            Text("flood forecasts")
                            HStack{//holds the buttons for the main menu
                                NavigationLink(destination: AboutView()) {
                                    Text("About").bold()//each navigation link takes you to a different screen
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red:0.039, green: 0.33, blue: 0.15))
                                        .cornerRadius(20)
                                }
                                NavigationLink(destination: MapView()) {
                                    Text("Map").bold()
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red:0.039, green: 0.33, blue: 0.15))
                                        .cornerRadius(20)
                                }
                                NavigationLink(destination: AlertView()) {
                                    Text("Alerts").bold()
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(red:0.039, green: 0.33, blue: 0.15))
                                        .cornerRadius(20)
                                }
                               /* NavigationLink(destination: DataView()) {
                                    Text("Data").bold()
                                        .padding()
                                        .background(Color(red:0.039, green: 0.33, blue: 0.15))
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .cornerRadius(20)
                                }*/
                            }
                        
                        HStack{
                            Link(destination: URL(string:"https://iflood.vse.gmu.edu/map/#stormPath")!){
                                Text("Website")}
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color(red:0.039, green: 0.33, blue: 0.15))
                                    .cornerRadius(20)
                            
                            Link(destination: URL(string: "https://www.facebook.com/gmuferreira")!){
                                Text("Facebook")}
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color(red:0.039, green: 0.33, blue: 0.15))
                                    .cornerRadius(20)
                                
                        }
                            Image("earth")
                                .resizable()
                                .frame(width: 210, height: 200)
                            Text("Powered by the GMU Flood Hazards Research Lab")
                                .font(.caption2)
                    }
            }
            //add social buttons
        }
        //.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
        
        }
}
/*struct MenuContent: View {
    var body: some View{
        List{
            Text("Home").onTapGesture{
                print("Home")
            }
            Text("About").onTapGesture{
                print("About")
            }
        }
    }
}*/

/*struct SideMenu: View {
    let width: CGFloat
    let height: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    var body: some View {
        ZStack {
            GeometryReader { _ in//organizes the menu
                EmptyView()
            }
            .background(Color.white.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.2))
            .onTapGesture {
                self.menuClose()
            }
        }
        HStack{//Menu stack
            MenuContent()
                .frame(width: self.width, height: self.height)
                .background(Color.green)
                .offset(x: self.isOpen ? 0 : -self.width) //when closed, it is off the screen
                    // when the menu is open (self.isOpen) x is set to 0
                .animation(.default)
            
            Spacer() //makes menu on left side aka space on the right
        }
        
    }
}*/


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
