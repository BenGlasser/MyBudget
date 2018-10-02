defmodule Mybudget.Budgets do
  @moduledoc """
  The Budgets context.
  """

  import Ecto.Query, warn: false
  alias Mybudget.Repo

  alias Mybudget.Budgets.Expense

  @doc """
  Returns the list of expenses.

  ## Examples

      iex> list_expenses()
      [%Expense{}, ...]

  """
  def list_expenses do
    Repo.all(Expense)
  end

  @doc """
  Gets a single expense.

  Raises `Ecto.NoResultsError` if the Expense does not exist.

  ## Examples

      iex> get_expense!(123)
      %Expense{}

      iex> get_expense!(456)
      ** (Ecto.NoResultsError)

  """
  def get_expense!(id), do: Repo.get!(Expense, id)

  @doc """
  Creates a expense.

  ## Examples

      iex> create_expense(%{field: value})
      {:ok, %Expense{}}

      iex> create_expense(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_expense(attrs \\ %{}) do
    %Expense{}
    |> Expense.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a expense.

  ## Examples

      iex> update_expense(expense, %{field: new_value})
      {:ok, %Expense{}}

      iex> update_expense(expense, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_expense(%Expense{} = expense, attrs) do
    expense
    |> Expense.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Expense.

  ## Examples

      iex> delete_expense(expense)
      {:ok, %Expense{}}

      iex> delete_expense(expense)
      {:error, %Ecto.Changeset{}}

  """
  def delete_expense(%Expense{} = expense) do
    Repo.delete(expense)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking expense changes.

  ## Examples

      iex> change_expense(expense)
      %Ecto.Changeset{source: %Expense{}}

  """
  def change_expense(%Expense{} = expense) do
    Expense.changeset(expense, %{})
  end

  alias Mybudget.Budgets.Credit

  @doc """
  Returns the list of credits.

  ## Examples

      iex> list_credits()
      [%Credit{}, ...]

  """
  def list_credits do
    Repo.all(Credit)
  end

  @doc """
  Gets a single credit.

  Raises `Ecto.NoResultsError` if the Credit does not exist.

  ## Examples

      iex> get_credit!(123)
      %Credit{}

      iex> get_credit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credit!(id), do: Repo.get!(Credit, id)

  @doc """
  Creates a credit.

  ## Examples

      iex> create_credit(%{field: value})
      {:ok, %Credit{}}

      iex> create_credit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credit(attrs \\ %{}) do
    %Credit{}
    |> Credit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credit.

  ## Examples

      iex> update_credit(credit, %{field: new_value})
      {:ok, %Credit{}}

      iex> update_credit(credit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credit(%Credit{} = credit, attrs) do
    credit
    |> Credit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Credit.

  ## Examples

      iex> delete_credit(credit)
      {:ok, %Credit{}}

      iex> delete_credit(credit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credit(%Credit{} = credit) do
    Repo.delete(credit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credit changes.

  ## Examples

      iex> change_credit(credit)
      %Ecto.Changeset{source: %Credit{}}

  """
  def change_credit(%Credit{} = credit) do
    Credit.changeset(credit, %{})
  end

  alias Mybudget.Budgets.Debit

  @doc """
  Returns the list of debits.

  ## Examples

      iex> list_debits()
      [%Debit{}, ...]

  """
  def list_debits do
    Repo.all(Debit)
  end

  @doc """
  Gets a single debit.

  Raises `Ecto.NoResultsError` if the Debit does not exist.

  ## Examples

      iex> get_debit!(123)
      %Debit{}

      iex> get_debit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_debit!(id), do: Repo.get!(Debit, id)

  @doc """
  Creates a debit.

  ## Examples

      iex> create_debit(%{field: value})
      {:ok, %Debit{}}

      iex> create_debit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_debit(attrs \\ %{}) do
    %Debit{}
    |> Debit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a debit.

  ## Examples

      iex> update_debit(debit, %{field: new_value})
      {:ok, %Debit{}}

      iex> update_debit(debit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_debit(%Debit{} = debit, attrs) do
    debit
    |> Debit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Debit.

  ## Examples

      iex> delete_debit(debit)
      {:ok, %Debit{}}

      iex> delete_debit(debit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_debit(%Debit{} = debit) do
    Repo.delete(debit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking debit changes.

  ## Examples

      iex> change_debit(debit)
      %Ecto.Changeset{source: %Debit{}}

  """
  def change_debit(%Debit{} = debit) do
    Debit.changeset(debit, %{})
  end
end
