defmodule QnaWeb.HomeLive do
  use QnaWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: to_form(%{}))}
  end

  def handle_event("goto_topic", %{"topic_name" => topic_name}, socket) do
    topic_link = "/" <> topic_name

    # The code inside the function first extracts the "topic_name" parameter from the changeset data using pattern matching, and stores it in a variable named topic_name. It then constructs a URL for the new topic page by concatenating "/" and the topic_name variable, and stores it in a variable named topic_link.

    {:noreply, push_redirect(socket, to: topic_link)}

    # Finally, the function returns a tuple of {:noreply, push_redirect(socket, to: topic_link)}. This tells Phoenix to update the current LiveView socket state to socket, and push a redirect event to the client, redirecting the user to the newly created topic page at the URL stored in topic_link.
  end
end
