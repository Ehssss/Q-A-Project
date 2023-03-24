defmodule Qna.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string
    field :username, :string

    # has_many :user_id, Qna.Topic
    # has_many :questions, Qna.Question
    # has_many :answers, Qna.Answer
    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:username, :password, :email])
    |> validate_required([:username, :password, :email])
  end
end
