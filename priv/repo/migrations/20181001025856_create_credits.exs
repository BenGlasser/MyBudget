defmodule Mybudget.Repo.Migrations.CreateCredits do
  use Ecto.Migration

  def change do
    create table(:credits) do
      add :amount, :float
      add :source, :string
      add :category, :string

      timestamps()
    end

  end
end
