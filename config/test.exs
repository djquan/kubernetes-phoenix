use Mix.Config

# Configure your database
config :kubernetes_phoenix, KubernetesPhoenix.Repo,
  username: "postgres",
  password: "postgres",
  database: "kubernetes_phoenix_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kubernetes_phoenix, KubernetesPhoenixWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
