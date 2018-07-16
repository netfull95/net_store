defmodule NetStore.Repo.Migrations.CreatTableOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add(:user_id, :varchar)
      add(:address, :varchar)
      add(:phone, :text)
      add(:note, :text)
      add(:shipping_fee, :integer, default: 0)
      add(:discount, :integer, default: 0)
      add(:items, {:array, :map}, default: [])

      timestamps()
    end
  end
end
