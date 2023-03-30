defmodule Qna.Repo.Migrations.RenameQuestionsTable do
  use Ecto.Migration

  def up do
    # alter table(:question) do
    rename table(:question), to: table(:questions)
    # end
  end
end
