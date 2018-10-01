defmodule Mybudget.BudgetsTest do
  use Mybudget.DataCase

  alias Mybudget.Budgets

  describe "expenses" do
    alias Mybudget.Budgets.Expense

    @valid_attrs %{amount: 120.5, category: "some category", item: "some item"}
    @update_attrs %{amount: 456.7, category: "some updated category", item: "some updated item"}
    @invalid_attrs %{amount: nil, category: nil, item: nil}

    def expense_fixture(attrs \\ %{}) do
      {:ok, expense} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Budgets.create_expense()

      expense
    end

    test "list_expenses/0 returns all expenses" do
      expense = expense_fixture()
      assert Budgets.list_expenses() == [expense]
    end

    test "get_expense!/1 returns the expense with given id" do
      expense = expense_fixture()
      assert Budgets.get_expense!(expense.id) == expense
    end

    test "create_expense/1 with valid data creates a expense" do
      assert {:ok, %Expense{} = expense} = Budgets.create_expense(@valid_attrs)
      assert expense.amount == 120.5
      assert expense.category == "some category"
      assert expense.item == "some item"
    end

    test "create_expense/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budgets.create_expense(@invalid_attrs)
    end

    test "update_expense/2 with valid data updates the expense" do
      expense = expense_fixture()
      assert {:ok, expense} = Budgets.update_expense(expense, @update_attrs)
      assert %Expense{} = expense
      assert expense.amount == 456.7
      assert expense.category == "some updated category"
      assert expense.item == "some updated item"
    end

    test "update_expense/2 with invalid data returns error changeset" do
      expense = expense_fixture()
      assert {:error, %Ecto.Changeset{}} = Budgets.update_expense(expense, @invalid_attrs)
      assert expense == Budgets.get_expense!(expense.id)
    end

    test "delete_expense/1 deletes the expense" do
      expense = expense_fixture()
      assert {:ok, %Expense{}} = Budgets.delete_expense(expense)
      assert_raise Ecto.NoResultsError, fn -> Budgets.get_expense!(expense.id) end
    end

    test "change_expense/1 returns a expense changeset" do
      expense = expense_fixture()
      assert %Ecto.Changeset{} = Budgets.change_expense(expense)
    end
  end

  describe "credits" do
    alias Mybudget.Budgets.Credit

    @valid_attrs %{amount: 120.5, category: "some category", source: "some source"}
    @update_attrs %{amount: 456.7, category: "some updated category", source: "some updated source"}
    @invalid_attrs %{amount: nil, category: nil, source: nil}

    def credit_fixture(attrs \\ %{}) do
      {:ok, credit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Budgets.create_credit()

      credit
    end

    test "list_credits/0 returns all credits" do
      credit = credit_fixture()
      assert Budgets.list_credits() == [credit]
    end

    test "get_credit!/1 returns the credit with given id" do
      credit = credit_fixture()
      assert Budgets.get_credit!(credit.id) == credit
    end

    test "create_credit/1 with valid data creates a credit" do
      assert {:ok, %Credit{} = credit} = Budgets.create_credit(@valid_attrs)
      assert credit.amount == 120.5
      assert credit.category == "some category"
      assert credit.source == "some source"
    end

    test "create_credit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budgets.create_credit(@invalid_attrs)
    end

    test "update_credit/2 with valid data updates the credit" do
      credit = credit_fixture()
      assert {:ok, credit} = Budgets.update_credit(credit, @update_attrs)
      assert %Credit{} = credit
      assert credit.amount == 456.7
      assert credit.category == "some updated category"
      assert credit.source == "some updated source"
    end

    test "update_credit/2 with invalid data returns error changeset" do
      credit = credit_fixture()
      assert {:error, %Ecto.Changeset{}} = Budgets.update_credit(credit, @invalid_attrs)
      assert credit == Budgets.get_credit!(credit.id)
    end

    test "delete_credit/1 deletes the credit" do
      credit = credit_fixture()
      assert {:ok, %Credit{}} = Budgets.delete_credit(credit)
      assert_raise Ecto.NoResultsError, fn -> Budgets.get_credit!(credit.id) end
    end

    test "change_credit/1 returns a credit changeset" do
      credit = credit_fixture()
      assert %Ecto.Changeset{} = Budgets.change_credit(credit)
    end
  end
end
