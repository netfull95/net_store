defmodule NetStore.Repo.Migrations.CreateTableStatistics do
  use Ecto.Migration

  def change do
    create table(:statistics) do
      add(:order_count, :integer, default: 0)
      add(:turnover, :integer, default: 0)

      timestamps()
    end
  end
end
