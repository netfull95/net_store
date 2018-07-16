defmodule NetStore.Sales.Post do
  use Ecto.Schema
  alias NetStore.Sales.Post
  alias NetStore.Repo

  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "posts" do
    field :title, :string
    field :message, :string
    field :user_id, :string
    field :image, :string
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [])
    |> validate_required([])
  end

  def get_post(type) do
    case type do
      "all"->
        (from p in Post, select: p)
        |> Repo.all
      # "dashboard"->
      #   (from p in Post, where: p.is_deleted == false, limit: 6, select: p)
      #   |> Repo.all
      _->
        nil
    end
  end

  def create_post(data) do
    %Post{
      title: data["title"],
      message: data["message"],
      user_id: data["user_id"],
      image: data["image"]
    }
    |> Repo.insert
  end

  def edit_post(data) do
    IO.inspect data

    post = Repo.get_by!(Post, %{id: data["id"]})
    Ecto.Changeset.change(post,
      %{
        title: data["title"],
        message: data["message"],
        user_id: data["user_id"],
        image: data["image"]
      }
    )
    |> Repo.update
  end

  def delete_post(data) do
    IO.inspect data
    list_ids = data["listIds"]
    Enum.map(list_ids, fn id ->
      Repo.get!(Post, id)
      |> Repo.delete
    end)
  end
end
