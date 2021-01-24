defmodule DesafioStone do
  def build(emails_list,shopping_list) do
    is_valid? = validate_lists(emails_list,shopping_list)
    case is_valid? do
      {:true, _} -> init(emails_list,shopping_list)
      {:false, reason } -> reason
    end
  end

  defp validate_lists(email_list,shopping_list) do
    cond do
      Enum.empty?(email_list) && Enum.empty?(shopping_list) -> {:false, "Both lists are empty!"}
      Enum.empty?(email_list) -> {:false, "Email list are empty!"}
      Enum.empty?(shopping_list) -> {:false, "Shopping list are empty!"}
      true -> {:true, :ok}
    end
  end

  defp init(emails_list,shopping_list) do
    emails_quantity = count_emails_quantity(emails_list)
    total_price = calc_total_price(shopping_list)

    emails_quantity
    |> calc(total_price)
    |> mount_map(emails_list)
  end

  defp calc_total_price(shopping_list) do
    Enum.reduce(shopping_list,0,fn x, acc -> acc + x[:price] * x[:quantity] end)
  end

  defp count_emails_quantity(emails_list) do
    Enum.count(emails_list)
  end

  defp calc(emails_quantity,total_price) do
    rest = rem(total_price,emails_quantity)
    case rest do
      0 -> equal_zero_calc(emails_quantity,total_price)
      _ -> different_zero_calc(rest,emails_quantity,total_price)
    end
  end

  defp equal_zero_calc(emails_quantity,total_price) do
    value = div(total_price,emails_quantity)
    %{:equal_zero => %{:value => value, :peoples_to_receive => emails_quantity}}
  end

  defp different_zero_calc(rest,emails_quantity,total_price) do
    more = rem(rest,emails_quantity)
    less = emails_quantity - more
    value = div(total_price, emails_quantity)
    %{:different_zero => %{:value_more => value + 1,:value_less => value, :peoples_to_receive_more => more, :peoples_to_receive_less => less}}
  end

  defp mount_map(%{:equal_zero => map},emails_list) do
    Enum.reduce(emails_list,%{},fn x, acc -> Map.put(acc, x,map[:value])end)
  end

  defp mount_map(%{:different_zero => map},emails_list) do
    Enum.reduce(emails_list,%{},
    fn x,acc->
      cond do
        Enum.count(acc) < map[:peoples_to_receive_more] -> Map.put(acc,x,map[:value_more])
        true -> Map.put(acc,x,map[:value_less])
      end
    end)
  end
end
