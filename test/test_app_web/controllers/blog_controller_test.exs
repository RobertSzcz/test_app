defmodule TestAppWeb.BlogControllerTest do
  use TestAppWeb.ConnCase
  alias TestApp.Blog
  alias TestApp.Blog.Post


  test "GET /blog/get_all_posts returns list of posts", %{conn: conn} do
    post = %Post{title: 'title', body: 'body'}
    {:ok, %Post{id: uuid, title: title, body: body}} = Blog.add_post(post)
    created_post_params = %{"id" => uuid, "title" => title, "body" => body}


    response =
      conn
      |> get(blog_path(conn, :get_all_posts))
      |> json_response(200)

    assert created_post_params in response
  end
end
