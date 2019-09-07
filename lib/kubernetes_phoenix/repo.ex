defmodule KubernetesPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :kubernetes_phoenix,
    adapter: Ecto.Adapters.Postgres
end
