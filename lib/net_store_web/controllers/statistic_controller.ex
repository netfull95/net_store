defmodule NetStoreWeb.StatisticController do
  use NetStoreWeb, :controller

  alias NetStore.Sales
  alias NetStore.Sales.Statistic

  action_fallback NetStoreWeb.FallbackController

  def index(conn, _params) do
    statistic = Statistic.list_statistic()
    render(conn, "index.json", statistic: statistic)
  end

  def create(conn, %{"statistic" => statistic_params}) do
    with {:ok, %Statistic{} = statistic} <- Sales.create_statistic(statistic_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", statistic_path(conn, :show, statistic))
      |> render("show.json", statistic: statistic)
    end
  end

  def show(conn, %{"id" => id}) do
    statistic = Sales.get_statistic!(id)
    render(conn, "show.json", statistic: statistic)
  end

  def update(conn, %{"id" => id, "statistic" => statistic_params}) do
    statistic = Sales.get_statistic!(id)

    with {:ok, %Statistic{} = statistic} <- Sales.update_statistic(statistic, statistic_params) do
      render(conn, "show.json", statistic: statistic)
    end
  end

  def delete(conn, %{"id" => id}) do
    statistic = Sales.get_statistic!(id)
    with {:ok, %Statistic{}} <- Sales.delete_statistic(statistic) do
      send_resp(conn, :no_content, "")
    end
  end
end
