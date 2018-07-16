defmodule NetStore.Repo.Migrations.CreateTablePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:title, :varchar)
      add(:message, :varchar)
      add(:user_id, :varchar)

      timestamps()
    end
  end
end
