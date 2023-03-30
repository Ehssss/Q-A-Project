defmodule Qna.Questions do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :body, :string
    field :upvotes, :integer
    # field :userid, :integer
    field :username, :string
    has_many :answers, Qna.Answers

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> unique_constraint(:name, [])
    # Removed userid
    |> cast(attrs, [:username, :upvotes, :body])
    |> validate_required([:username, :upvotes, :body])
  end

  def update_changeset(question, attrs) do
    question
    |> cast(attrs, [:upvotes])
    |> validate_required([:upvotes])
  end
end
