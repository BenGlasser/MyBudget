defmodule MybudgetWeb.CreditControllerTest do
  use MybudgetWeb.ConnCase

  alias Mybudget.Budgets
  alias Mybudget.Budgets.Credit

  @create_attrs %{amount: 120.5, category: "some category", source: "some source"}
  @update_attrs %{amount: 456.7, category: "some updated category", source: "some updated source"}
  @invalid_attrs %{amount: nil, category: nil, source: nil}

  def fixture(:credit) do
    {:ok, credit} = Budgets.create_credit(@create_attrs)
    credit
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all credits", %{conn: conn} do
      conn = get conn, credit_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create credit" do
    test "renders credit when data is valid", %{conn: conn} do
      conn = post conn, credit_path(conn, :create), credit: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, credit_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amount" => 120.5,
        "category" => "some category",
        "source" => "some source"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, credit_path(conn, :create), credit: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update credit" do
    setup [:create_credit]

    test "renders credit when data is valid", %{conn: conn, credit: %Credit{id: id} = credit} do
      conn = put conn, credit_path(conn, :update, credit), credit: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, credit_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "amount" => 456.7,
        "category" => "some updated category",
        "source" => "some updated source"}
    end

    test "renders errors when data is invalid", %{conn: conn, credit: credit} do
      conn = put conn, credit_path(conn, :update, credit), credit: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete credit" do
    setup [:create_credit]

    test "deletes chosen credit", %{conn: conn, credit: credit} do
      conn = delete conn, credit_path(conn, :delete, credit)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, credit_path(conn, :show, credit)
      end
    end
  end

  defp create_credit(_) do
    credit = fixture(:credit)
    {:ok, credit: credit}
  end
end
