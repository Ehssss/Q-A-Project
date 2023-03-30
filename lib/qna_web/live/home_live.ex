defmodule QnaWeb.HomeLive do
  alias Qna.Repo
  use QnaWeb, :live_view
  import Ecto.Query
  require Logger

  def mount(_params, _session, socket) do
    username = "Anonymous"

    questions =
      Qna.Repo.all(from q in Qna.Questions, order_by: [desc: q.upvotes])
      |> Enum.map(fn question ->
        answers = Qna.Repo.all(from a in Qna.Answers, where: a.question_id == ^question.id)
        Map.put(question, :answers, answers)
      end)

    # ß|> IO.inspect()

    {:ok,
     assign(socket,
       anonymous: false,
       username: username,
       questions: questions,
       form: to_form(%{})
     )}
  end

  def handle_event("question_submit", %{"enter_q" => enter_q}, socket) do
    Repo.insert(%Qna.Questions{body: enter_q, upvotes: 0, username: socket.assigns.username})
    {:noreply, socket}
  end

  def handle_event(
        "answer_submit",
        %{"answer" => answer, "question_id" => question_id_str},
        socket
      ) do
    question_id = String.to_integer(question_id_str)

    Repo.insert(%Qna.Answers{
      body: answer,
      upvotes: 0,
      username: socket.assigns.username,
      question_id: question_id
    })

    {:noreply, socket}
  end

  def handle_event("name_submit", %{"enter_name" => enter_name}, socket) do
    {:noreply, assign(socket, username: enter_name)}
  end

  def handle_event("toggle", _params, socket) do
    new_anonymous = !socket.assigns.anonymous
    {:noreply, assign(socket, anonymous: new_anonymous)}
  end

  def handle_event("upvote", %{"num" => num, "ref" => ref}, socket) do
    user_data = from q in Qna.Questions, where: q.id == ^ref
    question = Repo.one(user_data)
    IO.puts("before")
    changeset = Qna.Questions.update_changeset(question, %{upvotes: String.to_integer(num) + 1})

    Repo.update(changeset)
    |> IO.inspect()

    questions = socket.assigns.questions
    id = String.to_integer(ref)
    num = 1

    updated_questions =
      questions
      |> Enum.map(fn
        question when question.id == id ->
          question
          |> Map.update!(:upvotes, &(&1 + num))

        question ->
          question
      end)

    new_socket = assign(socket, questions: updated_questions)
    {:noreply, new_socket}
  end

  def handle_event("downvote", %{"num" => num, "ref" => ref}, socket) do
    user_data = from q in Qna.Questions, where: q.id == ^ref
    question = Repo.one(user_data)
    IO.inspect(question)
    update_data = Qna.Questions.update_changeset(question, %{upvotes: String.to_integer(num) - 1})
    Repo.update(update_data)

    questions = socket.assigns.questions
    id = String.to_integer(ref)
    num = 1

    updated_questions =
      questions
      |> Enum.map(fn
        question when question.id == id ->
          question
          |> Map.update!(:upvotes, &(&1 - num))

        question ->
          question
      end)

    new_socket = assign(socket, questions: updated_questions)
    {:noreply, new_socket}
  end

  def handle_event("upvote_ans", %{"num" => num, "ref" => ref, "answer_id" => answer_id}, socket) do
    IO.puts("TEST")
    IO.inspect(ref)
    IO.inspect(num)
    user_data = from a in Qna.Answers, where: a.question_id == ^ref and a.id == ^answer_id
    answer = Repo.one(user_data)
    IO.inspect(answer)

    update_data = Qna.Answers.update_changeset(answer, %{upvotes: String.to_integer(num) + 1})
    Repo.update(update_data)

    updated_answers =
      answer
      |> Map.put(:upvotes, answer.upvotes + 1)

    new_socket = assign(socket, questions: [updated_answers])
    {:noreply, new_socket}
  end

  def handle_event(
        "downvote_ans",
        %{"num" => num, "ref" => ref, "answer_id" => answer_id},
        socket
      ) do
    IO.puts("TEST")
    IO.inspect(ref)
    IO.inspect(num)

    user_data = from a in Qna.Answers, where: a.question_id == ^ref and a.id == ^answer_id
    answer = Repo.one(user_data)
    IO.inspect(answer)

    update_data = Qna.Answers.update_changeset(answer, %{upvotes: String.to_integer(num) - 1})
    Repo.update(update_data)

    updated_answers =
      answer
      |> Map.put(:upvotes, answer.upvotes - 1)

    new_socket = assign(socket, questions: [updated_answers])
    {:noreply, new_socket}
  end
end
