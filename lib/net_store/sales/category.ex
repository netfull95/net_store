defmodule NetStore.Sales.Category do
  use Ecto.Schema
  alias NetStore.Repo
  alias NetStore.Sales.Category

  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

   schema "categories" do
    field :name, :string
    field :description, :string
    field :is_deleted, :boolean
    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [])
    |> validate_required([])
  end

  def get_category(type) do
    case type do
      "all"->
        (from p in Category, select: p)
        |> Repo.all
      "dashboard"->
        (from p in Category, where: p.is_deleted == false, limit: 6, select: p)
        |> Repo.all
      _->
        nil
    end
  end

  def create_category(data) do
    %Category{
      name: data["name"],
      description: data["description"],
    }
    |> Repo.insert
  end

  def edit_category(data) do
    IO.inspect data

    category = Repo.get_by!(Category, %{id: data["id"]})
    Ecto.Changeset.change(category,
      %{
        id: data["id"],
        name: data["name"],
        description: data["description"],
      }
    )
    |> Repo.update
  end

  def delete_category(data) do
    IO.inspect data
    list_ids = data["listIds"]
    Enum.map(list_ids, fn id ->
      Repo.get!(Category, id)
      |> Repo.delete
    end)
  end
end
