defmodule NetStoreWeb.AccountController do
  use NetStoreWeb, :controller

  alias NetStore.Accounts
  alias NetStore.Accounts.Account

  action_fallback NetStoreWeb.FallbackController
end
