defmodule Mybudget.Budgets.Debit do
  use Ecto.Schema
  import Ecto.Changeset


  schema "debits" do
    field :amount, :float
    field :category, :string
    field :item, :string

    timestamps()
  end

  @doc false
  def changeset(debit, attrs) do
    debit
    |> cast(attrs, [:amount, :item, :category])
    |> validate_required([:amount, :item, :category])
  end
end
