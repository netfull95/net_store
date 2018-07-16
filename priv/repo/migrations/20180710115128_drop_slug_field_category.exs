defmodule NetStore.Repo.Migrations.DropSlugFieldCategory do
  use Ecto.Migration

  def change do
    alter table("categories") do
      remove :slug
    end
  end
end
