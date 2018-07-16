defmodule NetStore.Sales.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias NetStore.Repo
  alias NetStore.Sales.Order
  import Ecto.Query, only: [from: 2]

@primary_key {:id, :integer, read_after_writes: true}

  schema "orders" do
    field :user_id,           :string
    field :address,           :string
    field :phone,             :string
    field :note,              :string
    field :shipping_fee,      :integer
    field :discount,          :integer
    field :items,             {:array, :map}, default: []
    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [])
    |> validate_required([])
  end

  def get_order(type) do
    case type do
      "all"->
        (from p in Order, select: p)
        |> Repo.all
      "dashboard"->
        (from p in Order, where: p.is_deleted == false, limit: 6, select: p)
        |> Repo.all
      _->
        nil
    end
  end

  def create_order(data) do
    shipping_fee = if !data["shipping_fee"] || is_integer(data["shipping_fee"]), do: data["shipping_fee"] || 0, else: String.to_integer(data["shipping_fee"])
    discount = if !data["discount"] || is_integer(data["discount"]), do: data["discount"] || 0, else: String.to_integer(data["discount"])
    %Order{
      user_id: data["user_id"],
      address: data["address"],
      phone: data["phone"],
      note: data["note"],
      shipping_fee: shipping_fee,
      discount: discount,
      items: data["items"],
    }
    |> Repo.insert
  end

  def edit_order(data) do
    shipping_fee = if !data["shipping_fee"] || is_integer(data["shipping_fee"]), do: data["shipping_fee"] || 0, else: String.to_integer(data["shipping_fee"]) || 0
    discount = if !data["discount"] || is_integer(data["discount"]), do: data["discount"] || 0, else: String.to_integer(data["discount"]) || 0

    order = Repo.get_by!(Order, %{id: data["id"]})
    Ecto.Changeset.change(order,
      %{
        id: data["id"],
        user_id: data["user_id"],
        address: data["address"],
        phone: data["phone"],
        note: data["note"],
        shipping_fee: shipping_fee,
        discount: discount,
        items: data["items"],
      }
    )
    |> Repo.update
  end

  def delete_order(data) do
    list_ids = data["listIds"]
    Enum.map(list_ids, fn id ->
      Repo.get!(Order, id)
      |> Repo.delete
    end)
  end
end
