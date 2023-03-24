defmodule Qna.Questions do
  use Ecto.Schema
  import Ecto.Changeset

  schema "question" do
    field :body, :string
    field :topic, :string
    field :upvotes, :integer
    field :userid, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(questions, attrs) do
    questions
    |> cast(attrs, [:username, :userid, :upvotes, :body, :topic])
    |> validate_required([:username, :userid, :upvotes, :body, :topic])
  end
end
