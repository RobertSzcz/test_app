defmodule TestApp.BlogTest do
  use ExUnit.Case, async: false

  alias TestApp.Blog
  alias TestApp.Blog.Post

  test "add_post/1" do
    post = %Post{title: "Title", body: "Body"}

    {:ok, created_post} = Blog.add_post(post)

    assert %Post{id: uuid, title: "Title", body: "Body"} = created_post
    assert {:ok, _} = UUID.info(uuid)
  end

  test "get_post_by_id/1" do
    post = %Post{title: "Title", body: "Body"}
    {:ok, %Post{id: uuid}} = Blog.add_post(post)

    {:ok, resolved_post} = Blog.get_post_by_id(uuid)
    assert %Post{id: uuid, title: "Title", body: "Body"} = resolved_post
  end

  test "get_all_posts" do
    post = %Post{title: "Title1", body: "Body1"}

    {:ok, %Post{id: uuid}} = Blog.add_post(post)

    {:ok, resolved_posts} = Blog.get_all_posts()
    assert %Post{id: uuid, title: "Title1", body: "Body1"} in resolved_posts
  end
end
