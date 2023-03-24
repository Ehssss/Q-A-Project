# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
users = [
  %{
    username: "Alice",
    email: "alice@example.com",
    password: "password",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    username: "Bob",
    email: "bob@example.com",
    password: "password",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    username: "Charlie",
    email: "charlie@example.com",
    password: "password",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  }
]

#     Qna.Repo.insert!(%Qna.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Qna.Repo.insert_all(Qna.Users, users)
