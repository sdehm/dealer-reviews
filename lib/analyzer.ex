defmodule DealerReviews.Analyzer do
  @moduledoc """

  """
  def score_ratings(ratings = %DealerReviews.Review.Ratings{}) do
    %DealerReviews.Review.Ratings{
      customer_service: customer_service,
      friendliness: friendliness,
      overall: overall,
      pricing: pricing,
      recommend: recommend
    } = ratings

    # convert the recommend status to a numerical value
    recommend_value =
      case recommend do
        # highest rating is a 5
        true -> 5
        # lowest rating is a 1
        false -> 1
      end

    (customer_service + friendliness + overall + pricing + recommend_value) / 5
  end

  def score_employees(employees) do
    count_weight = 2
    count = Enum.count(employees)

    count_value =
      case count do
        # max score of 5, greater doesn't matter
        c when c >= 5 -> 5
        # lowest score of 1 when no employees
        0 -> 1
        c -> c
      end

    employees_rated = employees |> Enum.filter(fn e -> e.rating != nil end)

    employee_ratings_total =
      employees_rated
      |> Enum.map(fn e -> e.rating end)
      |> Enum.sum()

    (employee_ratings_total + count_value * count_weight) /
      (Enum.count(employees_rated) + count_weight)
  end
end
