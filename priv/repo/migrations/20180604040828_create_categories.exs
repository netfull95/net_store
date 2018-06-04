defmodule NetStore.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add(:name, :string, null: false)
      add(:description, :text)
      add(:slug, :string, null: false)
      add(:is_deleted, :boolean, default: false)

      timestamps()
    end

    create unique_index(:categories, [:slug])
    create unique_index(:products, [:slug])
  end
end
