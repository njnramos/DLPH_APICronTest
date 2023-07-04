import Config

config :api_cron_test, Apicron.Repo,
  database: "datalaketest",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"


config :api_cron_test,
  ecto_repos: [Apicron.Repo]
