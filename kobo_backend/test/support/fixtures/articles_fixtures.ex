defmodule Kobo.ArticlesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kobo.Articles` context.
  """

  @doc """
  Generate a article.
  """
  def article_fixture(attrs \\ %{}) do
    {:ok, article} =
      attrs
      |> Enum.into(%{
        image: "some image",
        text: "some text"
      })
      |> Kobo.Articles.create_article()

    article
  end
end
