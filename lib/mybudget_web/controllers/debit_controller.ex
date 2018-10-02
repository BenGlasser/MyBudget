defmodule MybudgetWeb.DebitController do
  use MybudgetWeb, :controller

  alias Mybudget.Budgets
  alias Mybudget.Budgets.Debit

  action_fallback MybudgetWeb.FallbackController

  def index(conn, _params) do
    debits = Budgets.list_debits()
    render(conn, "index.json", debits: debits)
  end

  def create(conn, %{"debit" => debit_params}) do
    with {:ok, %Debit{} = debit} <- Budgets.create_debit(debit_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", debit_path(conn, :show, debit))
      |> render("show.json", debit: debit)
    end
  end

  def show(conn, %{"id" => id}) do
    debit = Budgets.get_debit!(id)
    render(conn, "show.json", debit: debit)
  end

  def update(conn, %{"id" => id, "debit" => debit_params}) do
    debit = Budgets.get_debit!(id)

    with {:ok, %Debit{} = debit} <- Budgets.update_debit(debit, debit_params) do
      render(conn, "show.json", debit: debit)
    end
  end

  def delete(conn, %{"id" => id}) do
    debit = Budgets.get_debit!(id)
    with {:ok, %Debit{}} <- Budgets.delete_debit(debit) do
      send_resp(conn, :no_content, "")
    end
  end
end
