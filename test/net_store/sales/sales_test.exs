defmodule NetStore.SalesTest do
  use NetStore.DataCase

  alias NetStore.Sales

  describe "products" do
    alias NetStore.Sales.Product

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Sales.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Sales.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Sales.create_product(@valid_attrs)
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Sales.update_product(product, @update_attrs)
      assert %Product{} = product
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_product(product, @invalid_attrs)
      assert product == Sales.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Sales.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Sales.change_product(product)
    end
  end

  describe "categories" do
    alias NetStore.Sales.Category

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Sales.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Sales.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Sales.create_category(@valid_attrs)
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Sales.update_category(category, @update_attrs)
      assert %Category{} = category
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_category(category, @invalid_attrs)
      assert category == Sales.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Sales.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Sales.change_category(category)
    end
  end

  describe "posts" do
    alias NetStore.Sales.Posts

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def posts_fixture(attrs \\ %{}) do
      {:ok, posts} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_posts()

      posts
    end

    test "list_posts/0 returns all posts" do
      posts = posts_fixture()
      assert Sales.list_posts() == [posts]
    end

    test "get_posts!/1 returns the posts with given id" do
      posts = posts_fixture()
      assert Sales.get_posts!(posts.id) == posts
    end

    test "create_posts/1 with valid data creates a posts" do
      assert {:ok, %Posts{} = posts} = Sales.create_posts(@valid_attrs)
    end

    test "create_posts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_posts(@invalid_attrs)
    end

    test "update_posts/2 with valid data updates the posts" do
      posts = posts_fixture()
      assert {:ok, posts} = Sales.update_posts(posts, @update_attrs)
      assert %Posts{} = posts
    end

    test "update_posts/2 with invalid data returns error changeset" do
      posts = posts_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_posts(posts, @invalid_attrs)
      assert posts == Sales.get_posts!(posts.id)
    end

    test "delete_posts/1 deletes the posts" do
      posts = posts_fixture()
      assert {:ok, %Posts{}} = Sales.delete_posts(posts)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_posts!(posts.id) end
    end

    test "change_posts/1 returns a posts changeset" do
      posts = posts_fixture()
      assert %Ecto.Changeset{} = Sales.change_posts(posts)
    end
  end

  describe "order" do
    alias NetStore.Sales.Order

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_order()

      order
    end

    test "list_order/0 returns all order" do
      order = order_fixture()
      assert Sales.list_order() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Sales.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Sales.create_order(@valid_attrs)
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, order} = Sales.update_order(order, @update_attrs)
      assert %Order{} = order
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_order(order, @invalid_attrs)
      assert order == Sales.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Sales.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Sales.change_order(order)
    end
  end

  describe "statistic" do
    alias NetStore.Sales.Statistic

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def statistic_fixture(attrs \\ %{}) do
      {:ok, statistic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_statistic()

      statistic
    end

    test "list_statistic/0 returns all statistic" do
      statistic = statistic_fixture()
      assert Sales.list_statistic() == [statistic]
    end

    test "get_statistic!/1 returns the statistic with given id" do
      statistic = statistic_fixture()
      assert Sales.get_statistic!(statistic.id) == statistic
    end

    test "create_statistic/1 with valid data creates a statistic" do
      assert {:ok, %Statistic{} = statistic} = Sales.create_statistic(@valid_attrs)
    end

    test "create_statistic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_statistic(@invalid_attrs)
    end

    test "update_statistic/2 with valid data updates the statistic" do
      statistic = statistic_fixture()
      assert {:ok, statistic} = Sales.update_statistic(statistic, @update_attrs)
      assert %Statistic{} = statistic
    end

    test "update_statistic/2 with invalid data returns error changeset" do
      statistic = statistic_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_statistic(statistic, @invalid_attrs)
      assert statistic == Sales.get_statistic!(statistic.id)
    end

    test "delete_statistic/1 deletes the statistic" do
      statistic = statistic_fixture()
      assert {:ok, %Statistic{}} = Sales.delete_statistic(statistic)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_statistic!(statistic.id) end
    end

    test "change_statistic/1 returns a statistic changeset" do
      statistic = statistic_fixture()
      assert %Ecto.Changeset{} = Sales.change_statistic(statistic)
    end
  end

  describe "category" do
    alias NetStore.Sales.Category

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_category()

      category
    end

    test "list_category/0 returns all category" do
      category = category_fixture()
      assert Sales.list_category() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Sales.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Sales.create_category(@valid_attrs)
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Sales.update_category(category, @update_attrs)
      assert %Category{} = category
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_category(category, @invalid_attrs)
      assert category == Sales.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Sales.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Sales.change_category(category)
    end
  end
end
