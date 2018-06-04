defmodule NetStore.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add(:username, :string, null: false)
      add(:password, :string, null: false)
      add(:address, :text)
      add(:phone_number, :string)
      add(:email, :string)

      timestamps()
    end

    create unique_index(:accounts, [:username])
  end
end
