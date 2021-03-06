defmodule ScrollWeb.Router do
  use ScrollWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ScrollWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ScrollWeb.LayoutView, :admin}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :authenticate
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ScrollWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/admin", ScrollWeb, as: :admin do
    pipe_through :admin

    live "/", AdminLive.Index, as: :index

    live "/posts", Admin.PostLive.Index, :index
    live "/posts/new", Admin.PostLive.New, :new
    live "/posts/:id", Admin.PostLive.Edit, :edit
  end

  def authenticate(conn, _opts) do
    Plug.Conn.put_session(conn, :current_user, "Pedro")
  end
end
