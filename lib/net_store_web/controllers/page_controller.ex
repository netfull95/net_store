defmodule NetStoreWeb.PageController do
  use NetStoreWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
