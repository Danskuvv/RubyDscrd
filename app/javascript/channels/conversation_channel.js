// app/javascript/channels/conversation_channel.js
import consumer from "channels/consumer"



// Use Turbo's event to ensure the DOM is loaded (or use DOMContentLoaded if you're not using Turbo)
document.addEventListener("turbo:load", () => {
  const chatArea = document.getElementById("chat-area")
  if (chatArea) {
    // Get the conversation ID from the data attribute; if it's not present, skip subscription.
    const conversationId = chatArea.dataset.conversationId
    if (conversationId) {
      consumer.subscriptions.create(
        { channel: "ConversationChannel", conversation_id: conversationId },
        {
          connected() {
            console.log(`Connected to ConversationChannel for conversation ${conversationId}`)
          },
          disconnected() {
            console.log("Disconnected from ConversationChannel")
          },
          received(data) {
            // Assume data.message contains HTML for the new message.
            const chatMessages = document.getElementById("chat-messages")
            if (chatMessages) {
              chatMessages.insertAdjacentHTML('beforeend', data.message)
            }
          }
        }
      )
    }
  }
})
