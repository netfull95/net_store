defmodule NetStore.Sales do
  @moduledoc """
  The Sales context.
  """

  import Ecto.Query, warn: false
  alias NetStore.Repo

  alias NetStore.Sales.Order

  @doc """
  Returns the list of order.

  ## Examples

      iex> list_order()
      [%Order{}, ...]

  """
  def list_order do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{source: %Order{}}

  """
  def change_order(%Order{} = order) do
    Order.changeset(order, %{})
  end

  alias NetStore.Sales.Statistic

  @doc """
  Returns the list of statistic.

  ## Examples

      iex> list_statistic()
      [%Statistic{}, ...]

  """
  def list_statistic do
    Repo.all(Statistic)
  end

  @doc """
  Gets a single statistic.

  Raises `Ecto.NoResultsError` if the Statistic does not exist.

  ## Examples

      iex> get_statistic!(123)
      %Statistic{}

      iex> get_statistic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_statistic!(id), do: Repo.get!(Statistic, id)

  @doc """
  Creates a statistic.

  ## Examples

      iex> create_statistic(%{field: value})
      {:ok, %Statistic{}}

      iex> create_statistic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_statistic(attrs \\ %{}) do
    %Statistic{}
    |> Statistic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a statistic.

  ## Examples

      iex> update_statistic(statistic, %{field: new_value})
      {:ok, %Statistic{}}

      iex> update_statistic(statistic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_statistic(%Statistic{} = statistic, attrs) do
    statistic
    |> Statistic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Statistic.

  ## Examples

      iex> delete_statistic(statistic)
      {:ok, %Statistic{}}

      iex> delete_statistic(statistic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_statistic(%Statistic{} = statistic) do
    Repo.delete(statistic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking statistic changes.

  ## Examples

      iex> change_statistic(statistic)
      %Ecto.Changeset{source: %Statistic{}}

  """
  def change_statistic(%Statistic{} = statistic) do
    Statistic.changeset(statistic, %{})
  end

  alias NetStore.Sales.Category

  @doc """
  Returns the list of category.

  ## Examples

      iex> list_category()
      [%Category{}, ...]

  """
  def list_category do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change_category(%Category{} = category) do
    Category.changeset(category, %{})
  end
end
