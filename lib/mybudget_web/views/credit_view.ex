defmodule MybudgetWeb.CreditView do
  use MybudgetWeb, :view
  alias MybudgetWeb.CreditView

  def render("index.json", %{credits: credits}) do
    %{data: render_many(credits, CreditView, "credit.json")}
  end

  def render("show.json", %{credit: credit}) do
    %{data: render_one(credit, CreditView, "credit.json")}
  end

  def render("credit.json", %{credit: credit}) do
    %{id: credit.id,
      amount: credit.amount,
      source: credit.source,
      category: credit.category}
  end
end
