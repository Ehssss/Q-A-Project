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

questions = [
  %{
    body: "what came first, the chicken or the egg?",
    upvotes: 10,
    userid: 1,
    username: "First",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    body: "Why did the chicken cross the road?",
    upvotes: 80,
    userid: 2,
    username: "Second",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    body: "What is Obama's last name?",
    upvotes: 800,
    userid: 3,
    username: "3th",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    body:
      "It replaces the position that corresponds to the index with the value in the :current key, which is either :black or :white, depending on which players turn it is. In the template, we add phx-click and",
    upvotes: 90,
    userid: 4,
    username: "QWErtyuoiopasdfghjklzxcvbnmmnbvcxzlkjhgfdsaiuytrewq",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  }
]

#     Qna.Repo.insert!(%Qna.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Qna.Repo.insert_all(Qna.Users, users)
Qna.Repo.insert_all(Qna.Questions, questions)
