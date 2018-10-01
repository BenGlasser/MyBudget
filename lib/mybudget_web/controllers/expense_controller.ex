defmodule MybudgetWeb.ExpenseController do
  use MybudgetWeb, :controller

  alias Mybudget.Budgets
  alias Mybudget.Budgets.Expense

  def index(conn, _params) do
    expenses = Budgets.list_expenses()
    render(conn, "index.html", expenses: expenses)
  end

  def new(conn, _params) do
    changeset = Budgets.change_expense(%Expense{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"expense" => expense_params}) do
    case Budgets.create_expense(expense_params) do
      {:ok, expense} ->
        conn
        |> put_flash(:info, "Expense created successfully.")
        |> redirect(to: expense_path(conn, :show, expense))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    expense = Budgets.get_expense!(id)
    render(conn, "show.html", expense: expense)
  end

  def edit(conn, %{"id" => id}) do
    expense = Budgets.get_expense!(id)
    changeset = Budgets.change_expense(expense)
    render(conn, "edit.html", expense: expense, changeset: changeset)
  end

  def update(conn, %{"id" => id, "expense" => expense_params}) do
    expense = Budgets.get_expense!(id)

    case Budgets.update_expense(expense, expense_params) do
      {:ok, expense} ->
        conn
        |> put_flash(:info, "Expense updated successfully.")
        |> redirect(to: expense_path(conn, :show, expense))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", expense: expense, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    expense = Budgets.get_expense!(id)
    {:ok, _expense} = Budgets.delete_expense(expense)

    conn
    |> put_flash(:info, "Expense deleted successfully.")
    |> redirect(to: expense_path(conn, :index))
  end
end
