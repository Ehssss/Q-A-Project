# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Qna.Repo.insert!(%Qna.SomeSchema{})
Qna.Repo.insert(
  Qna.Users,
  [
    %{username: "Alice", email: "alice@example.com", password: "password"},
    %{username: "Bob", email: "bob@example.com", password: "password"},
    %{username: "Charlie", email: "charlie@example.com", password: "password"}
  ],
  on_conflict: :replace_all
)

#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
