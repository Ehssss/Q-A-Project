defmodule QnaWeb.HomeLive do
  alias Qna.Repo
  use QnaWeb, :live_view
  import Ecto.Query
  import Repo
  require Logger

  def mount(_params, _session, socket) do
    username = "Anon"

    {:ok,
     assign(socket,
       users_online: [],
       anonymous: false,
       username: username,
       message: "",
       questions: Qna.Questions |> Qna.Repo.all(),
       temporary_assigns: [chat_messages: []],
       form: to_form(%{})
     )}
  end

  def handle_event("question_submit", %{"enter_q" => enter_q}, socket) do
    Repo.insert(%Qna.Questions{body: enter_q, upvotes: -10, userid: 10, username: "JAmes"})
    {:noreply, socket}
  end

  def handle_event("toggle", _params, socket) do
    new_anonymous = !socket.assigns.anonymous
    {:noreply, assign(socket, anonymous: new_anonymous)}
  end

  def handle_event("upvote", %{"num" => num, "ref" => ref}, socket) do
    user_data = from q in Qna.Questions, where: q.id == ^ref
    question = Repo.one(user_data)
    IO.inspect(question)
    IO.inspect(num)
    update_data = Qna.Questions.changeset(question, %{upvotes: String.to_integer(num) + 1})
    Repo.update(update_data)
    IO.inspect(update_data)

    # IO.inspect(results, charlists: :as_lists)

    # query =
    #   from u in "users",
    #     where: u.age > 18,
    #     select: u.name

    {:noreply, socket}
  end
end
