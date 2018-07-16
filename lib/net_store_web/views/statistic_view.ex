defmodule NetStoreWeb.StatisticView do
  use NetStoreWeb, :view
  alias NetStoreWeb.StatisticView

  def render("index.json", %{statistic: statistic}) do
    %{data: render_many(statistic, StatisticView, "statistic.json")}
  end

  def render("show.json", %{statistic: statistic}) do
    %{data: render_one(statistic, StatisticView, "statistic.json")}
  end

  def render("statistic.json", %{statistic: statistic}) do
    %{id: statistic.id}
  end
end
