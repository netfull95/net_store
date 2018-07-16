defmodule NetStore.Repo.Migrations.UpdateFieldImagesProduct do
  use Ecto.Migration

  def change do
    alter table("products") do
      modify :images, :text
    end
  end
end
