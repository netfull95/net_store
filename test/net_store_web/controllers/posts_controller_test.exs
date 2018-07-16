defmodule NetStoreWeb.PostsControllerTest do
  use NetStoreWeb.ConnCase

  alias NetStore.Sales
  alias NetStore.Sales.Posts

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:posts) do
    {:ok, posts} = Sales.create_posts(@create_attrs)
    posts
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get conn, posts_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create posts" do
    test "renders posts when data is valid", %{conn: conn} do
      conn = post conn, posts_path(conn, :create), posts: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, posts_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, posts_path(conn, :create), posts: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update posts" do
    setup [:create_posts]

    test "renders posts when data is valid", %{conn: conn, posts: %Posts{id: id} = posts} do
      conn = put conn, posts_path(conn, :update, posts), posts: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, posts_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, posts: posts} do
      conn = put conn, posts_path(conn, :update, posts), posts: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete posts" do
    setup [:create_posts]

    test "deletes chosen posts", %{conn: conn, posts: posts} do
      conn = delete conn, posts_path(conn, :delete, posts)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, posts_path(conn, :show, posts)
      end
    end
  end

  defp create_posts(_) do
    posts = fixture(:posts)
    {:ok, posts: posts}
  end
end
