//
//  AlertView.swift
//  iFlood
//
//  Created by Spencer Sisters on 8/30/21.
//

import SwiftUI
import UserNotifications
import Foundation

class LocalNotificationManager: ObservableObject {
    var notifications = [Notification]()
}

struct AlertView: View {
    @State private var email: String = ""
    @ObservedObject var notificationManager = LocalNotificationManager()
    @State private var highFloodLevels = true
    var levels = 4
    
    init()
    {
        if (levels>=3)
        {
            self._highFloodLevels = State(initialValue: true)
        }
    }
    
    var body: some View {
        ZStack{
            Color(red:0.039, green: 0.35, blue: 0.15)
                .ignoresSafeArea()
        VStack{
            Text("Alerts")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("Get notified about flood risks in your area").bold()
                .foregroundColor(.white)
            
            Spacer()
                .frame(height:50)
            
            Button(action://first button allows notifications
            {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
                //immediately sends a notification once it has permission
                //self.notificationManager.sendNotification(title: "Hurray!", subtitle: "yay", body: "If you see this text, launching the local notification worked!", launchIn: 5)
                
            }) {//what the button looks like
                Text("Request Real-Time Alerts")
                    .padding()
                    .font(.title)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
            /*
            levels = 4
            VStack{
                EmptyView()
                }
                .alert(isPresented: $highFloodLevels){
                    Alert(title: Text("Warning"), message: Text("High Flood Levels"), dismissButton: .default(Text("I am safe")))
                }
            }*/
            /*Button(action: //make this not a button, an if-statement for when a flood watch occurs
            {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }) {
                Text("Schedule Notifications")
                    .padding()
                    .font(.title)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }*/
           // Text("Phone number or email:")
                //.foregroundColor(.white)
            //TextField( "Enter phone number or email", //text: $email)
                //.foregroundColor(.black)
                //.font(.title)
                //.multilineTextAlignment(.center)
        }
        }.alert("high flood levels", isPresented: self.$highFloodLevels)
        {
            Button("ok", role:.cancel){}
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}

//sends a notification - can customize later
func sendNotification(title: String, subtitle: String?, body: String, launchIn: Double) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        if let subtitle = subtitle {
            content.subtitle = subtitle
        }
        content.body = body
           
        let imageName = "logo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        content.attachments = [attachment]
    
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
            let request = UNNotificationRequest(identifier: "demoNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
