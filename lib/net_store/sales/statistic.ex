defmodule NetStore.Sales.Statistic do
  use Ecto.Schema
  import Ecto.Changeset
  alias NetStore.Repo
  alias NetStore.Sales.Statistic
  import Ecto.Query, only: [from: 2]

  schema "statistics" do
    field :order_count,           :integer
    field :turnover,              :integer
    field :date,                  :date
    timestamps()
  end

  @doc false
  def changeset(statistic, attrs) do
    statistic
    |> cast(attrs, [])
    |> validate_required([])
  end

  def list_statistic() do
    Repo.all(from s in Statistic, select: s)
  end

  def update_statistic(params) do
    today = NaiveDateTime.utc_now()
    IO.inspect today
    order = Repo.get_by(Statistic, %{date: today})
    |> IO.inspect
    # Ecto.Changeset.change(order,
    #   %{
    #     order_count: params["order_count"]
    #     turnover: params["turnover"]
    #   }
    # )
    # |> Repo.update
  end
end
