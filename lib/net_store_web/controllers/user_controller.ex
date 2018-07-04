defmodule NetStoreWeb.UserController do
  use NetStoreWeb, :controller

  alias NetStore.Accounts
  alias NetStore.Accounts.User

  action_fallback NetStoreWeb.FallbackController

  def login(conn, params) do
    username =  params["userName"]
    password = params["password"]
    User.get_user_by_username(username)
    |> case  do
      nil ->
        json conn, %{success: false, message: "Tài khoản không tồn tại"}
      data ->
        if data.password == password do
          user = %{
            name: data.name,
            permission: data.permission,
            phone_number: data.phone_number,
            id: data.id,
            email: data.email,
            address: data.address,
            username: data.username
          }
          json conn, %{success: true, message: "Đăng nhập thành công", data: user}
        else
          json conn, %{success: false, message: "Sai mật khẩu"}
        end
    end
  end

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
