defmodule NetStore.Repo.Migrations.UpdateProduct do
  use Ecto.Migration
  def change do
    alter table("products") do
      add :remain_quantity, :integer, default: 0
      add :import_price, :integer, default: 0
      add :category_id, :integer
      add :description, :varchar
      add :provider, :varchar
      add :is_remove, :boolean
      remove :slug
      remove :detail_information
    end
  end
end
