defmodule TestAppWeb.BlogController do
  use TestAppWeb, :controller
  # We will use CQRS instead of CRUD

  alias TestApp.Blog
  alias TestApp.Blog.Post

  def get_all_posts(conn, _params) do
    {:ok, posts} = Blog.get_all_posts()
    json conn, posts
  end

  def get_post(conn, %{"id" => id}) do
    {:ok, post} = Blog.get_post_by_id(id)
    json conn, post
  end
  def get_post(conn, _params), do: json conn, %{error: "Post id required"}

  def add_post(conn, %{"title" => title, "body" => body}) do
    post_data = %Post{title: title, body: body}
    {:ok, post} = Blog.add_post(post_data)
    json conn, post
  end
  def add_post(conn, _params), do: json conn, %{error: "Invalid params"}
end
