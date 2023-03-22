defmodule QnaWeb.TopicLive do
  use QnaWeb, :live_view

  def mount(params = %{"topic_name" => topic_name}, _session, socket) do
    username = "Anon"

    # if connected?(socket) do
    #   ChatWeb.Endpoint.subscribe(topic_name)
    #   ChatWeb.Presence.track(self(), topic_name, username, %{})
    # end

    # subscribing the LiveView process to a PubSub topic and tracking the user's presence on that topic. This is an important step in enabling real-time communication between the server and the client, as it allows the server to send messages to the LiveView process when new data becomes available.

    {:ok,
     assign(socket,
       topic_name: topic_name,
       users_online: [],
       username: username,
       message: "",
       chat_messages: [],
       temporary_assigns: [chat_messages: []],
       form: to_form(%{})
     )}
  end
end
