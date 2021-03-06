defmodule MybudgetWeb.Router do
  use MybudgetWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MybudgetWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/json/expenses", ExpenseController
    resources "/credits", CreditController, except: [:new, :edit]
    resources "/json/debits", DebitController, except: [:new, :edit]

    # Other scopes may use custom stacks.
    # scope "/api", MybudgetWeb do
    #   pipe_through :api
    # end
  end
end