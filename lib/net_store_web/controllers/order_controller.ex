defmodule NetStoreWeb.OrderController do
  use NetStoreWeb, :controller

  alias NetStore.Sales.Order
  alias NetStore.Sales.Statistic

  action_fallback NetStoreWeb.FallbackController

  def index(conn, params) do
    type = params["type"]
    orders = Order.get_order(type)
    data = Enum.map(orders, fn p ->
      %{
        id: p.id,
        user_id: p.user_id,
        address: p.address,
        phone: p.phone,
        note: p.note,
        shipping_fee: p.shipping_fee,
        discount: p.discount,
        items: p.items,
      }
    end)
    json conn, %{success: true, data: data}
  end

  def create(conn, params) do
    Order.create_order(params)
    Statistic.update_statistic(params)
    json conn, %{success: true, data: params}
  end

  def edit(conn, params) do
    Order.edit_order(params)
    |> case do
      {:ok,  _}->
        json conn, %{success: true}
      {:error, changeset} ->
        IO.inspect changeset
        json conn, %{success: false}
    end
  end

  def delete(conn, params) do
    Order.delete_order(params)
    json conn, %{success: true}
  end
end
