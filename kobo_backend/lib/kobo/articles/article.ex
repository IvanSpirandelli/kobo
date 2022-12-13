defmodule Kobo.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset
  schema "articles" do
    field :image, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:image, :text])
    |> validate_required([:image, :text])
  end
end
