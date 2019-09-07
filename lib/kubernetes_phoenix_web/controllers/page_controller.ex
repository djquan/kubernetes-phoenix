defmodule KubernetesPhoenixWeb.PageController do
  use KubernetesPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
