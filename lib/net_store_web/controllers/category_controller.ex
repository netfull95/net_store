defmodule NetStoreWeb.CategoryController do
  use NetStoreWeb, :controller

  alias NetStore.Sales
  alias NetStore.Sales.Category

  action_fallback NetStoreWeb.FallbackController
end
