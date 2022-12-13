defmodule Kobo.Repo do
  use Ecto.Repo,
    otp_app: :kobo,
    adapter: Ecto.Adapters.Postgres
end
