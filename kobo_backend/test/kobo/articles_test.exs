defmodule Kobo.ArticlesTest do
  use Kobo.DataCase
  alias Kobo.Articles

  describe "articles" do
    alias Kobo.Articles.Article

    import Kobo.ArticlesFixtures

    @invalid_attrs %{image: nil, text: nil}

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Articles.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Articles.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      valid_attrs = %{image: "some image", text: "some text"}

      assert {:ok, %Article{} = article} = Articles.create_article(valid_attrs)
      assert article.image == "some image"
      assert article.text == "some text"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Articles.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      update_attrs = %{image: "some updated image", text: "some updated text"}

      assert {:ok, %Article{} = article} = Articles.update_article(article, update_attrs)
      assert article.image == "some updated image"
      assert article.text == "some updated text"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Articles.update_article(article, @invalid_attrs)
      assert article == Articles.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Articles.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Articles.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Articles.change_article(article)
    end

    test "get_latest/0 returns latest article added to db" do
      a_one = article_fixture()
      a_two = article_fixture()
      assert Articles.ordered_article_indices() == Enum.sort([a_one.id, a_two.id])
    end
  end
end
