defmodule NetStoreWeb.OrderView do
  use NetStoreWeb, :view
  alias NetStoreWeb.OrderView

  def render("index.json", %{order: order}) do
    %{data: render_many(order, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id}
  end
end
