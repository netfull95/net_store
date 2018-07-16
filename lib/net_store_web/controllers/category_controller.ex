defmodule NetStoreWeb.CategoryController do
  use NetStoreWeb, :controller

  alias NetStore.Sales.Category

  action_fallback NetStoreWeb.FallbackController

  def index(conn, params) do
    type = params["type"]
    categories = Category.get_category(type)
    data = Enum.map(categories, fn p ->
      %{
        id: p.id,
        name: p.name,
        description: p.description,
      }
    end)
    IO.inspect data
    json conn, %{success: true, data: data}
  end

  def create(conn, params) do
    Category.create_category(params)
    json conn, %{success: true, data: params}
  end

  def edit(conn, params) do
    Category.edit_category(params)
    |> case do
      {:ok,  _}->
        json conn, %{success: true}
      {:error, changeset} ->
        IO.inspect changeset
        json conn, %{success: false}
    end
  end

  def delete(conn, params) do
    Category.delete_category(params)
    json conn, %{success: true}
  end
end
