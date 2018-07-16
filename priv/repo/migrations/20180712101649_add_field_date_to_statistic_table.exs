defmodule NetStore.Repo.Migrations.AddFieldDateToStatisticTable do
  use Ecto.Migration

  def change do
    alter table("statistics") do
      add :date, :date
    end
  end
end
