defmodule GoStudy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GoStudyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GoStudy.PubSub},
      # Start the Endpoint (http/https)
      GoStudyWeb.Endpoint
      # Start a worker by calling: GoStudy.Worker.start_link(arg)
      # {GoStudy.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GoStudy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GoStudyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
