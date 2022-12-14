defmodule MyWeb.Router do
  use MyWeb, :router

  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {MyWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyWeb do
    pipe_through :browser

    live "/", MainLive
    live_dashboard "/dashboard", metrics: MyWeb.Telemetry
  end
end
