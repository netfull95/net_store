defmodule NetStoreWeb.StatisticControllerTest do
  use NetStoreWeb.ConnCase

  alias NetStore.Sales
  alias NetStore.Sales.Statistic

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:statistic) do
    {:ok, statistic} = Sales.create_statistic(@create_attrs)
    statistic
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all statistic", %{conn: conn} do
      conn = get conn, statistic_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create statistic" do
    test "renders statistic when data is valid", %{conn: conn} do
      conn = post conn, statistic_path(conn, :create), statistic: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, statistic_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, statistic_path(conn, :create), statistic: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update statistic" do
    setup [:create_statistic]

    test "renders statistic when data is valid", %{conn: conn, statistic: %Statistic{id: id} = statistic} do
      conn = put conn, statistic_path(conn, :update, statistic), statistic: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, statistic_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, statistic: statistic} do
      conn = put conn, statistic_path(conn, :update, statistic), statistic: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete statistic" do
    setup [:create_statistic]

    test "deletes chosen statistic", %{conn: conn, statistic: statistic} do
      conn = delete conn, statistic_path(conn, :delete, statistic)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, statistic_path(conn, :show, statistic)
      end
    end
  end

  defp create_statistic(_) do
    statistic = fixture(:statistic)
    {:ok, statistic: statistic}
  end
end
