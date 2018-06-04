defmodule NetStoreWeb.CategoryControllerTest do
  use NetStoreWeb.ConnCase

  alias NetStore.Sales
  alias NetStore.Sales.Category

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:category) do
    {:ok, category} = Sales.create_category(@create_attrs)
    category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all categories", %{conn: conn} do
      conn = get conn, category_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create category" do
    test "renders category when data is valid", %{conn: conn} do
      conn = post conn, category_path(conn, :create), category: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, category_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, category_path(conn, :create), category: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update category" do
    setup [:create_category]

    test "renders category when data is valid", %{conn: conn, category: %Category{id: id} = category} do
      conn = put conn, category_path(conn, :update, category), category: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, category_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, category: category} do
      conn = put conn, category_path(conn, :update, category), category: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete category" do
    setup [:create_category]

    test "deletes chosen category", %{conn: conn, category: category} do
      conn = delete conn, category_path(conn, :delete, category)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, category_path(conn, :show, category)
      end
    end
  end

  defp create_category(_) do
    category = fixture(:category)
    {:ok, category: category}
  end
end
