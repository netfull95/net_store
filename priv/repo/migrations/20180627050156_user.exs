defmodule NetStore.Repo.Migrations.User do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:username, :string)
      add(:password, :string)
      add(:name, :string)
      add(:email, :string)
      add(:address, :string)
      add(:phone_number, :string)
      add(:permission, :string)
      timestamps()
    end
  end
end
