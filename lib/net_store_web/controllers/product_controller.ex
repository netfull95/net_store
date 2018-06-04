defmodule NetStoreWeb.ProductController do
  use NetStoreWeb, :controller

  alias NetStore.Sales
  alias NetStore.Sales.Product

  action_fallback NetStoreWeb.FallbackController
end
