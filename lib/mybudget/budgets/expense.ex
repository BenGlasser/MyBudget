defmodule Mybudget.Budgets.Expense do
  use Ecto.Schema
  import Ecto.Changeset


  schema "expenses" do
    field :amount, :float
    field :category, :string
    field :item, :string

    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:amount, :item, :category])
    |> validate_required([:amount, :item, :category])
  end
end
