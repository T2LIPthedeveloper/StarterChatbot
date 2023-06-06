//
//  ContentView.swift
//  StarterChatbot
//
//  Created by Atul Parida on 06/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    // the text currently inside our box
    @State var messages: [String] = ["[BOT]Welcome to the chatbot!"]
    // the list of all messages in our chat
    
    
    var body: some View {
        VStack {
            //Our app header and probably an icon.
            HStack {
                Text("Chatbot")
                    .foregroundColor(.yellow)
                Image(systemName: "bubble.right.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 40))
                    // what do you think is wrong here?
            }
            
            
            //This is where our messages go!
            ScrollView {
                // We're going to go through the list of all messages and show them on the screen.
                ForEach(messages, id: \.self) { message in
                    if message.contains("USER") {
                        HStack {
                            //HStacks! They go from left to right i.e. the first item is the leftmost item.
                            Spacer()
                            // Moves the text to the right.
                            Text(message)
                                .foregroundColor(.yellow)
                        }
                    }
                    else {
                        HStack {
                            Text(message)
                                .foregroundColor(.yellow)
                            Spacer()
                            // Moves the text to the left.
                        }
                    }
                    
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Color.red)
            // rotates the text boxes inside, brings them to the bottom of the screen
            
            // Our text message box and send button
            HStack {
                TextField("Type something!", text: $messageText)
                    .padding()
                    // gives a bit of space between our message box and everything else
                    .background(.white)
                    .onSubmit {
                        // This is what happens when the text gets submitted!
                        sendMessage(message: messageText)
                    }
                Button {
                    // sends a message to the chatbot
                    sendMessage(message: messageText)
                } label: {
                    Text("Send")
                        .foregroundColor(.yellow)
                    // This acts as your send button
                }
            }
            .padding()
        }
        .background(Color.black)
        // What do you think is wrong with this app?
    }
    
    func sendMessage(message: String) {
        if !message.isEmpty {
            //if the message is empty, we don't respond.
            messages.append("[USER]" + message)
            // Adds the user message to the list of all messages.
            self.messageText = ""
            // Resets the text in our message box.
            messages.append("[BOT]" + getBotResponse(message: message))
            // Gets the bot's response and adds it to the list of messages.
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // This allows us to see a live preview of our design!
    }
}
