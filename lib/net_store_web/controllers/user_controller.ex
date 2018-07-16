defmodule NetStoreWeb.UserController do
  use NetStoreWeb, :controller

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

  def register(conn, params) do
    username =  params["userName"]
    User.get_user_by_username(username)
    |> case  do
      nil ->
        User.create_user(params)
        json conn, %{success: true, message: "Đăng ký thành công", data: params}
      _->
        json conn, %{success: false, message: "Đăng ký thất bại, tài khoản đã bị trùng"}
    end
  end

  def index(conn, params) do
    type = params["type"]
    value = params["value"]
    users = User.get_user(type, value)
    data = Enum.map(users, fn p ->
      %{
        id: p.id,
        name: p.name,
        username: p.username,
        email: p.email,
        phone_number: p.phone_number,
        address: p.address,
        password: p.password,
        permission: p.permission
      }
    end)
    IO.inspect data
    json conn, %{success: true, data: data}
  end

   def edit(conn, params) do
    User.edit_user(params)
    |> case do
      {:ok,  _}->
        json conn, %{success: true}
      {:error, changeset} ->
        IO.inspect changeset
        json conn, %{success: false}
    end
  end

  def delete(conn, params) do
    User.delete_user(params)
    json conn, %{success: true}
  end
end
