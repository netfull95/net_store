defmodule NetStore.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add(:name, :string, null: false)
      add(:slug, :string, null: false)
      add(:detail_information, :text)
      add(:images, {:array, :text})
      add(:price, :integer, default: 0)
      add(:is_deleted, :boolean, default: false)

      timestamps()
    end

  end
end
