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
end
