defmodule Qna.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topic" do
    field :topic, :string
    field :userid, :integer
    field :username, :string

    # belongs_to :user, Qna.User
    # has_many :questions, Qna.Question
    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:username, :topic])
    |> validate_required([:username, :topic])
  end
end
