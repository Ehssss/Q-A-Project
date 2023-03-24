defmodule Qna.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :email, :string

      timestamps()
    end

    create table(:question) do
      add :username, :string
      add :userid, :integer
      add :upvotes, :integer
      add :body, :string
      add :topic, :string

      timestamps()
    end

    create table(:answers) do
      add :username, :string
      add :userid, :integer
      add :upvotes, :integer
      add :body, :string
      add :topic, :string

      timestamps()
    end

    create table(:topic) do
      add :username, :string
      add :userid, :integer
      add :topic, :string

      timestamps()
    end
  end
end
