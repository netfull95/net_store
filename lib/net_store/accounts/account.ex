defmodule NetStore.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset


  schema "account" do

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [])
    |> validate_required([])
  end
end
