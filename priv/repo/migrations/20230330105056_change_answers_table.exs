defmodule Qna.Repo.Migrations.ChangeAnswersTable do
  use Ecto.Migration

  def change do
    alter table(:answers) do
      add :question_id, references(:questions), null: false
    end
  end
end
