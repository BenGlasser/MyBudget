defmodule MybudgetWeb.PageController do
  use MybudgetWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
