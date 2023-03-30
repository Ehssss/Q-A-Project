defmodule Qna.Answers do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :body, :string
    field :upvotes, :integer
    # field :userid, :integer
    field :username, :string
    belongs_to :question, Qna.Questions
    # field :question_id, :integer
    timestamps()
  end

  @doc false
  def changeset(answers, attrs) do
    answers
    |> cast(attrs, [:username, :upvotes, :body])
    |> validate_required([:username, :upvotes, :body])
  end

  def update_changeset(answers, attrs) do
    answers
    |> cast(attrs, [:upvotes])
    |> validate_required([:upvotes])
  end
end
