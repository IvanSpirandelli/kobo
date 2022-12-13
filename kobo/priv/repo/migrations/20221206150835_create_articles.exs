defmodule Kobo.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :image, :string
      add :text, :string

      timestamps()
    end
  end
end
