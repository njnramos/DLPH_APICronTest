defmodule Api_cron_test.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      Apicrontest.Application,
      Apicron.Repo.Registry
    ]

    opts = [strategy: :one_for_one, name: Ecto.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
