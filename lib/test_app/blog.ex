defmodule TestApp.Blog do
  @moduledoc """
    This is our blog interface
  """

  alias TestApp.Blog.Post

  def add_post(%Post{title: title, body: body} = post) do
    id = UUID.uuid1()
    true = :ets.insert(:post_lookup, {id, {title, body}})
    {:ok, %Post{id: id, title: title, body: body}}
  end

  def get_post_by_id(uuid) do
    [params] = :ets.lookup(:post_lookup, uuid)
    {:ok, post_from_ets_params(params)}
  end

  def get_all_posts() do
    data = :ets.match_object(:post_lookup, {:"$1", :"$2"})

    posts = Enum.map(data, fn x -> post_from_ets_params(x) end)

    {:ok, posts}
  end

  def update_post(%Post{} = post) do
    # TODO
    # check if post exisits in ets
    # simply replace it with new post tuple
  end

  def delete_post_by_id(id) do
    # TODO
    # check out elixir ETS https://elixirschool.com/en/lessons/specifics/ets/
  end

  defp post_from_ets_params(params) do
    {uuid, {title, body}} = params
    %Post{id: uuid, title: title, body: body}
  end
end
