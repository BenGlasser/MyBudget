defmodule MybudgetWeb.DebitView do
  use MybudgetWeb, :view
  alias MybudgetWeb.DebitView

  def render("index.json", %{debits: debits}) do
    %{data: render_many(debits, DebitView, "debit.json")}
  end

  def render("show.json", %{debit: debit}) do
    %{data: render_one(debit, DebitView, "debit.json")}
  end

  def render("debit.json", %{debit: debit}) do
    %{id: debit.id,
      amount: debit.amount,
      item: debit.item,
      category: debit.category}
  end
end
