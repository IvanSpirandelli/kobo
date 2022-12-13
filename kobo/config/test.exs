import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :kobo, Kobo.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "kobo_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kobo, KoboWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "v2R21vUaW9WrXRbIEdA4oRlhE0g769fP79dWV4Et5F2vE8uz2eMG8LPIl7J7iqWV",
  server: false

# In test we don't send emails.
config :kobo, Kobo.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
