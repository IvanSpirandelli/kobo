defmodule Kobo.Articles do
  @moduledoc """
  The Articles context.
  """

  import Ecto.Query, warn: false
  alias Kobo.Repo

  alias Kobo.Articles.Article

  @doc """
  Returns the list of articles.

  ## Examples

      iex> list_articles()
      [%Article{}, ...]

  """
  def list_articles do
    Repo.all(Article)
  end

  def ordered_article_indices do
    #Repo.all(from a in Article, select: a.id)
    #from(a in Article, select: a.id) |> Repo.all
    Enum.sort((from(a in Article, select: a.id) |> Repo.all))
  end

  def get_latest_article do
    id = ordered_article_indices() |> List.last
    case id do
      nil -> {:error, %Article{}}
      _ -> {:ok, get_article!(id)}
    end
  end

  def get_previous_article(id) do
    indices = ordered_article_indices()
    id_index = Enum.find_index(indices, fn(x) -> x == id end)
    case id_index do
      0 -> {:ok, get_article!(Enum.at(indices, id_index))}
      _ -> {:ok, get_article!(Enum.at(indices, id_index-1))}
    end
  end

  def get_next_article(id) do
    indices = ordered_article_indices()
    id_index = Enum.find_index(indices, fn(x) -> x == id end)
    last = Kernel.length(indices)-1
    case id_index do
      ^last -> {:ok, get_article!(Enum.at(indices, id_index))}
      _ -> {:ok, get_article!(Enum.at(indices, id_index+1))}
    end
  end

  @doc """
  Gets a single article.

  Raises `Ecto.NoResultsError` if the Article does not exist.

  ## Examples

      iex> get_article!(123)
      %Article{}

      iex> get_article!(456)
      ** (Ecto.NoResultsError)

  """
  def get_article!(id), do: Repo.get!(Article, id)

  @doc """
  Creates a article.

  ## Examples

      iex> create_article(%{field: value})
      {:ok, %Article{}}

      iex> create_article(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_article(attrs \\ %{}) do
    %Article{}
    |> Article.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a article.

  ## Examples

      iex> update_article(article, %{field: new_value})
      {:ok, %Article{}}

      iex> update_article(article, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_article(%Article{} = article, attrs) do
    article
    |> Article.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a article.

  ## Examples

      iex> delete_article(article)
      {:ok, %Article{}}

      iex> delete_article(article)
      {:error, %Ecto.Changeset{}}

  """
  def delete_article(%Article{} = article) do
    Repo.delete(article)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking article changes.

  ## Examples

      iex> change_article(article)
      %Ecto.Changeset{data: %Article{}}

  """
  def change_article(%Article{} = article, attrs \\ %{}) do
    Article.changeset(article, attrs)
  end
end
