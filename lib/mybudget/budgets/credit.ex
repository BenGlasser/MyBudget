defmodule Mybudget.Budgets.Credit do
  use Ecto.Schema
  import Ecto.Changeset


  schema "credits" do
    field :amount, :float
    field :category, :string
    field :source, :string

    timestamps()
  end

  @doc false
  def changeset(credit, attrs) do
    credit
    |> cast(attrs, [:amount, :source, :category])
    |> validate_required([:amount, :source, :category])
  end
end
