defmodule QnaWeb.HomeLive do
  alias Qna.Repo
  use QnaWeb, :live_view
  import Ecto.Query
  import Repo
  require Logger

  def mount(_params, _session, socket) do
    username = "Anonymous"
    questions = Qna.Repo.all(from q in Qna.Questions, order_by: [desc: q.upvotes]) |> IO.inspect()
    {:ok,
     assign(socket,
       users_online: [],
       anonymous: false,
       username: username,
       questions: questions,
       form: to_form(%{})
     )}
  end


  def handle_event("question_submit", %{"enter_q" => enter_q}, socket) do
    Repo.insert(%Qna.Questions{body: enter_q, upvotes: 0, username: socket.assigns.username })
    {:noreply, socket}
  end

  def handle_event("name_submit",%{"enter_name" => enter_name}, socket) do
    {:noreply, assign(socket, username: enter_name)}
  end

  def handle_event("toggle", _params, socket) do
    new_anonymous = !socket.assigns.anonymous
    {:noreply, assign(socket, anonymous: new_anonymous)}
  end

  def handle_event("upvote", %{"num" => num, "ref" => ref}, socket) do
    user_data = from q in Qna.Questions, where: q.id == ^ref
    question = Repo.one(user_data)
    IO.inspect(question)
    IO.inspect(ref)

    IO.inspect(num)
    update_data = Qna.Questions.changeset(question, %{upvotes: String.to_integer(num) + 1})
    Repo.update(update_data)
    IO.inspect(update_data)
    {:noreply, socket}
  end

  def handle_event("downvote", %{"num" => num, "ref" => ref}, socket) do
    user_data = from q in Qna.Questions, where: q.id == ^ref
    question = Repo.one(user_data)
    IO.inspect(question)
    IO.inspect(num)
    update_data = Qna.Questions.changeset(question, %{downvotes: String.to_integer(num) - 1})
    Repo.update(update_data)
    IO.inspect(update_data)
    {:noreply, socket}
  end
end
