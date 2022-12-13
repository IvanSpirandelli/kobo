defmodule KoboWeb.ArticleView do
  use KoboWeb, :view
  alias KoboWeb.ArticleView

  def render("index.json", %{articles: articles}) do
    %{data: render_many(articles, ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{data: render_one(article, ArticleView, "article.json")}
  end

  def render("article.json", %{article: article}) do
    %{
      id: article.id,
      image: article.image,
      text: article.text
    }
  end

  def render("article_with_status.json", %{status: status, article: article}) do
    %{
      status: status,
      article: article,
    }
  end
end
