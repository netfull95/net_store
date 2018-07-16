defmodule NetStore.Repo.Migrations.DropTableAccount do
  use Ecto.Migration

  def change do
    drop table("accounts")
  end
end
