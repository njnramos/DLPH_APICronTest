defmodule Apicron.Repo do
  use Ecto.Repo,
    otp_app: :api_cron_test,
    adapter: Ecto.Adapters.Postgres
end
