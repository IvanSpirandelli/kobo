defmodule KoboWeb.Router do
  use KoboWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KoboWeb do
    pipe_through :api
  end

  scope "/api/article", KoboWeb do
    pipe_through :api

    post "/create", ArticleController, :create
    put "/update/:id", ArticleController, :update
    delete "/delete/:id", ArticleController, :delete
    get "/index", ArticleController, :index

    get "/latest", ArticleController, :latest_article
    get "/previous/:id", ArticleController, :previous_article
    get "/next/:id", ArticleController, :next_article

    get "/:id", ArticleController, :show
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: KoboWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
