defmodule Mybudget.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :amount, :float
      add :item, :string
      add :category, :string

      timestamps()
    end

  end
end
