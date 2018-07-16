defmodule NetStore.Repo.Migrations.AddFieldImagePost do
  use Ecto.Migration

  def change do
    alter table("posts") do
      add :image, :varchar
    end
  end
end
