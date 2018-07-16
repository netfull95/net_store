defmodule NetStoreWeb.PostController do
  use NetStoreWeb, :controller

  # alias NetStore.Sales
  alias NetStore.Sales.Post

  action_fallback NetStoreWeb.FallbackController

  def index(conn, params) do
    type = params["type"]
    posts = Post.get_post(type)
    data = Enum.map(posts, fn p ->
      %{
        id: p.id,
        title: p.title,
        message: p.message,
        user_id: p.user_id,
        image: p.image,
        inserted_at: p.inserted_at
      }
    end)
    IO.inspect data
    json conn, %{success: true, data: data}
  end

  def create(conn, params) do
    Post.create_post(params)
    json conn, %{success: true, data: params}
  end

  def edit(conn, params) do
    Post.edit_post(params)
    |> case do
      {:ok,  _}->
        json conn, %{success: true}
      {:error, changeset} ->
        IO.inspect changeset
        json conn, %{success: false}
    end
  end

  def delete(conn, params) do
    Post.delete_post(params)
    json conn, %{success: true}
  end
end
