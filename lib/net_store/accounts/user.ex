defmodule NetStore.Accounts.User do
  use Ecto.Schema
  alias NetStore.Accounts.User
  alias NetStore.Repo
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

@primary_key {:id, :integer, read_after_writes: true}
  schema "users" do
    field :name,                :string
    field :username,            :string
    field :password,            :string
    field :email,               :string
    field :phone_number,        :string
    field :address,             :string
    field :permission,          :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [])
    |> validate_required([])
  end

  def get_user_by_username(username) do
    Repo.one(
      from s in User,
      where: s.username == ^username
    )
  end

  def create_user(data) do
    %User{
      name: data["name"],
      username: data["userName"],
      password: data["password"],
      email: data["email"],
      phone_number: data["phone"],
      address: data["address"],
      permission: data["permission"] || "user"
    }
    |> Repo.insert
  end

  def get_user(type, _value) do
    case type do
      "all"->
        (from p in User, select: p)
        |> Repo.all
      # "dashboard"->
      #   (from p in Post, where: p.is_deleted == false, limit: 6, select: p)
      #   |> Repo.all
      _->
        nil
    end
  end

def edit_user(data) do
    IO.inspect "xxxxxx"
    IO.inspect data

    post = Repo.get_by!(User, %{id: data["id"]})
    Ecto.Changeset.change(post,
      %{
        name: data["name"],
        username: data["userName"],
        password: data["password"],
        email: data["email"],
        phone_number: data["phone"],
        address: data["address"],
        permission: data["permission"] || "user"
      }
    )
    |> Repo.update
  end

  def delete_user(data) do
    IO.inspect data
    list_ids = data["listIds"]
    Enum.map(list_ids, fn id ->
      Repo.get!(User, id)
      |> Repo.delete
    end)
  end
end
