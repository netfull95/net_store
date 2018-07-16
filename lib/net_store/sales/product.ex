defmodule NetStore.Sales.Product do
  use Ecto.Schema
  alias NetStore.Sales.Product
  alias NetStore.Repo
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "products" do
    field :name,                :string
    field :images,              :string
    field :price,               :integer
    field :is_deleted,          :boolean
    field :remain_quantity,     :integer
    field :import_price,        :integer
    field :category_id,         :integer
    field :description,         :string
    field :provider,            :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [])
    |> validate_required([])
  end

  def search_product(value) do
    value = "%#{value}%"
    (from p in Product, where: ilike(p.name, ^value), select: p)
    |> Repo.all
  end

  def get_product(type) do
    case type do
      "all"->
        (from p in Product, where: p.is_deleted == false, select: p)
        |> Repo.all
      "dashboard"->
        (from p in Product, where: p.is_deleted == false, limit: 6, select: p)
        |> Repo.all
      _->
        nil
    end
  end

  def create_product(data) do
    %Product{
      name: data["name"],
      images: data["images"],
      price: String.to_integer(data["price"]),
      is_deleted: false,
      remain_quantity: String.to_integer(data["remain_quantity"]),
      import_price: String.to_integer(data["import_price"]),
      category_id: String.to_integer(data["category_id"]),
      description: data["description"],
      provider: data["provider"]
    }
    |> Repo.insert
  end


  def edit_product(data) do
    IO.inspect data
    price = if is_integer(data["price"]), do: data["price"], else: String.to_integer(data["price"])
    remain_quantity = if is_integer(data["remain_quantity"]), do: data["remain_quantity"], else: String.to_integer(data["remain_quantity"])
    import_price = if is_integer(data["import_price"]), do: data["import_price"], else: String.to_integer(data["import_price"])
    category_id = if is_integer(data["category_id"]), do: data["category_id"], else: String.to_integer(data["category_id"])

    product = Repo.get_by!(Product, %{id: data["id"]})
    Ecto.Changeset.change(product,
      %{
        name: data["name"],
        images: data["images"],
        price: price,
        is_deleted: false,
        remain_quantity: remain_quantity,
        import_price: import_price,
        category_id: category_id,
        description: data["description"],
        provider: data["provider"]
      }
    )
    |> Repo.update
  end

  def delete_product(data) do
    IO.inspect data
    list_ids = data["listIds"]
    Enum.map(list_ids, fn id ->
      product = Repo.get_by!(Product, %{id: id})
      Ecto.Changeset.change(product, %{is_deleted: true})
      |> Repo.update
    end)
  end
end
