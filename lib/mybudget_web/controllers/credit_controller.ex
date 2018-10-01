defmodule MybudgetWeb.CreditController do
  use MybudgetWeb, :controller

  alias Mybudget.Budgets
  alias Mybudget.Budgets.Credit

  action_fallback MybudgetWeb.FallbackController

  def index(conn, _params) do
    credits = Budgets.list_credits()
    render(conn, "index.json", credits: credits)
  end

  def create(conn, %{"credit" => credit_params}) do
    with {:ok, %Credit{} = credit} <- Budgets.create_credit(credit_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", credit_path(conn, :show, credit))
      |> render("show.json", credit: credit)
    end
  end

  def show(conn, %{"id" => id}) do
    credit = Budgets.get_credit!(id)
    render(conn, "show.json", credit: credit)
  end

  def update(conn, %{"id" => id, "credit" => credit_params}) do
    credit = Budgets.get_credit!(id)

    with {:ok, %Credit{} = credit} <- Budgets.update_credit(credit, credit_params) do
      render(conn, "show.json", credit: credit)
    end
  end

  def delete(conn, %{"id" => id}) do
    credit = Budgets.get_credit!(id)
    with {:ok, %Credit{}} <- Budgets.delete_credit(credit) do
      send_resp(conn, :no_content, "")
    end
  end
end
