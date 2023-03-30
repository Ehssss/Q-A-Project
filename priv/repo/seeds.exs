# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#

questions = [
  %{
    body: "What came first, the chicken or the egg?",
    upvotes: 10,
    # userid: 1,
    username: "NewGenPhilosopher",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    body: "Why did the chicken cross the road?",
    upvotes: -4,
    # userid: 2,
    username: "Fast and Curious",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    body: "What is Obama's last name?",
    upvotes: 30,
    # userid: 3,
    username: "DonalDump",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    body:
      "Hi, I'm currently revising for my maths exams. Can someone remind me of the pythagorus theorem formula please?",
    upvotes: 15,
    # userid: 4,
    username: "Anonymous",
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  }
]

answers = [
  %{
    body: "idk lol",
    upvotes: -10,
    username: "Jessie",
    question_id: 15,
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    body: "I think it's a^2 + b^2 = c^2",
    upvotes: 23,
    username: "James",
    question_id: 15,
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    body: "Are you serious?",
    upvotes: 400,
    username: "Obama Obama",
    question_id: 16,
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  },
  %{
    body: "To exercise its animal rights.",
    upvotes: -3,
    username: "StayWoke",
    question_id: 15,
    inserted_at: NaiveDateTime.truncate(DateTime.utc_now(), :second),
    updated_at: NaiveDateTime.truncate(DateTime.utc_now(), :second)
  }
]

#     Qna.Repo.insert!(%Qna.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# Qna.Repo.insert_all(Qna.Users, users)

Qna.Repo.insert_all(Qna.Questions, questions)

Qna.Repo.insert_all(Qna.Answers, answers)

# Make sure answer id's and question id's match as appropriate
