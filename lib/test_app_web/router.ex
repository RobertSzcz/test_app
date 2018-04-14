defmodule TestAppWeb.Router do
  use TestAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TestAppWeb do
    pipe_through :browser # Use the default browser stack
  end

  scope "/api/v1", TestAppWeb do
    pipe_through :api

    get "/blog/get_all_posts", BlogController, :get_all_posts
    get "/blog/add_post", BlogController, :add_post
    get "/blog/get_post", BlogController, :get_post
  end
end
