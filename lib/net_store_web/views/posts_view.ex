defmodule NetStoreWeb.PostsView do
  use NetStoreWeb, :view
  alias NetStoreWeb.PostsView

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostsView, "posts.json")}
  end

  def render("show.json", %{posts: posts}) do
    %{data: render_one(posts, PostsView, "posts.json")}
  end

  def render("posts.json", %{posts: posts}) do
    %{id: posts.id}
  end
end
