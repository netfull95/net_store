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
end
