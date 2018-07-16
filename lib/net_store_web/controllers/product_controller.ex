defmodule NetStoreWeb.ProductController do
  use NetStoreWeb, :controller

  # alias NetStore.Sales
  alias NetStore.Sales.Product

  def index(conn, params) do
    type = params["type"]
    products = Product.get_product(type)
    data = Enum.map(products, fn p ->
      %{
        category_id: p.category_id,
        description: p.description,
        id: p.id,
        images: p.images,
        import_price: p.import_price,
        is_deleted: p.is_deleted,
        name: p.name,
        price: p.price,
        provider: p.provider,
        remain_quantity: p.remain_quantity,
      }
    end)
    json conn, %{success: true, data: data}
  end

  def create(conn, params) do
    Product.create_product(params)
    json conn, %{success: true, data: params}
  end

  def edit(conn, params) do
    Product.edit_product(params)
    |> case do
      {:ok,  _}->
        json conn, %{success: true}
      {:error, changeset} ->
        IO.inspect changeset
        json conn, %{success: false}
    end
  end

  def delete(conn, params) do
    Product.delete_product(params)
    json conn, %{success: true}
  end

  def search(conn, params) do
    value = params["value"]
    products = Product.search_product(value)
    data = Enum.map(products, fn p ->
      %{
        category_id: p.category_id,
        description: p.description,
        id: p.id,
        images: p.images,
        import_price: p.import_price,
        is_deleted: p.is_deleted,
        name: p.name,
        price: p.price,
        provider: p.provider,
        remain_quantity: p.remain_quantity,
      }
    end)
    json conn, %{success: true, data: data}
  end

  action_fallback NetStoreWeb.FallbackController
end
