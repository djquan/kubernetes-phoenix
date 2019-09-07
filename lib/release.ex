defmodule KubernetesPhoenix.Release do
  @app :kubernetes_phoenix

  def migrate do
    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp repos do
    Application.load(@app)
    {:ok, _} = Application.ensure_all_started(@app)
    Application.fetch_env!(@app, :ecto_repos)
  end
end
