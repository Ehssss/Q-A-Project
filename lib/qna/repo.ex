defmodule Qna.Repo do
  use Ecto.Repo,
    otp_app: :qna,
    adapter: Ecto.Adapters.Postgres
end
