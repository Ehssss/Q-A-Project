defmodule Qna.Answers do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :body, :string
    field :topic, :string
    field :upvotes, :integer
    field :userid, :integer
    field :username, :string

    # belongs_to :user, Qna.User
    # belongs_to :question, Qna.Question
    timestamps()
  end

  @doc false
  def changeset(answers, attrs) do
    answers
    |> cast(attrs, [:username, :userid, :upvotes, :body, :topic])
    |> validate_required([:username, :userid, :upvotes, :body, :topic])
  end
end
