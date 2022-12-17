defmodule Listophobic.Repo do
  use Ecto.Repo,
    otp_app: :listophobic,
    adapter: Ecto.Adapters.Postgres
end
