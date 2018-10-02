defmodule MybudgetWeb.DebitControllerTest do
  use MybudgetWeb.ConnCase

  alias Mybudget.Budgets
  alias Mybudget.Budgets.Debit

  @create_attrs %{amount: 120.5, category: "some category", item: "some item"}
  @update_attrs %{amount: 456.7, category: "some updated category", item: "some updated item"}
  @invalid_attrs %{amount: nil, category: nil, item: nil}

  def fixture(:debit) do
    {:ok, debit} = Budgets.create_debit(@create_attrs)
    debit
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all debits", %{conn: conn} do
      conn = get conn, debit_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create debit" do
    test "renders debit when data is valid", %{conn: conn} do
      conn = post conn, debit_path(conn, :create), debit: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, debit_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amount" => 120.5,
        "category" => "some category",
        "item" => "some item"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, debit_path(conn, :create), debit: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update debit" do
    setup [:create_debit]

    test "renders debit when data is valid", %{conn: conn, debit: %Debit{id: id} = debit} do
      conn = put conn, debit_path(conn, :update, debit), debit: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, debit_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amount" => 456.7,
        "category" => "some updated category",
        "item" => "some updated item"}
    end

    test "renders errors when data is invalid", %{conn: conn, debit: debit} do
      conn = put conn, debit_path(conn, :update, debit), debit: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete debit" do
    setup [:create_debit]

    test "deletes chosen debit", %{conn: conn, debit: debit} do
      conn = delete conn, debit_path(conn, :delete, debit)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, debit_path(conn, :show, debit)
      end
    end
  end

  defp create_debit(_) do
    debit = fixture(:debit)
    {:ok, debit: debit}
  end
end
