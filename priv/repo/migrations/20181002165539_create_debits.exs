defmodule Mybudget.Repo.Migrations.CreateDebits do
  use Ecto.Migration

  def change do
    create table(:debits) do
      add :amount, :float
      add :item, :string
      add :category, :string

      timestamps()
    end

  end
end
