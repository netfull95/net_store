defmodule NetStoreWeb.Router do
  use NetStoreWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NetStoreWeb do
    pipe_through :api

    scope "/users" do
      options "/login",             UserController,      :options
      post "/login",                UserController,      :login
      post "/register",             UserController,      :register
      get "/",                      UserController,      :index
      post "/edit",                 UserController,      :edit
      post  "/delete",              UserController,      :delete
    end

    scope "/posts" do
      get   "/",                      PostController, :index
      post  "/create",                PostController, :create
      post  "/edit",                  PostController, :edit
      post  "/delete",                PostController, :delete
    end

    scope "/orders" do
      get   "/",                      OrderController, :index
      post  "/create",                OrderController, :create
      post  "/edit",                  OrderController, :edit
      post  "/delete",                OrderController, :delete
    end

    scope "/statistics" do

    end

    scope "/categories" do
      get   "/",                      CategoryController, :index
      post  "/create",                CategoryController, :create
      post  "/edit",                  CategoryController, :edit
      post  "/delete",                CategoryController, :delete
    end

    scope "/products" do
      get   "/",                      ProductController, :index
      post  "/create",                ProductController, :create
      post  "/edit",                  ProductController, :edit
      post  "/delete",                ProductController, :delete
      get   "/search",                ProductController, :search
    end

  end
  # Other scopes may use custom stacks.
  # scope "/api", NetStoreWeb do
  #   pipe_through :api
  # end
end
