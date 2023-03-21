defmodule Qna.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      QnaWeb.Telemetry,
      # Start the Ecto repository
      Qna.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Qna.PubSub},
      # Start Finch
      {Finch, name: Qna.Finch},
      # Start the Endpoint (http/https)
      QnaWeb.Endpoint
      # Start a worker by calling: Qna.Worker.start_link(arg)
      # {Qna.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Qna.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    QnaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
