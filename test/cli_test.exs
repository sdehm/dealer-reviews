defmodule CliTest do
  use ExUnit.Case
  doctest DealerReviews.Cli
  import ExUnit.CaptureIO

  @review_fixture DealerReviews.Review.create(
                    "Title",
                    "Customer",
                    ~D[2021-11-18],
                    3,
                    "reason",
                    "body",
                    DealerReviews.Review.Ratings.create(4, 4, 4, 4, 4, true),
                    [
                      DealerReviews.Review.EmployeeReview.create("Employee 1", 5),
                      DealerReviews.Review.EmployeeReview.create("Employee 2", 3)
                    ]
                  )

  test "prints review to console" do
    expected = """
    %DealerReviews.Review{
      body: "body",
      customer: "Customer",
      date: ~D[2021-11-18],
      employees: [
        %DealerReviews.Review.EmployeeReview{name: "Employee 1", rating: 5},
        %DealerReviews.Review.EmployeeReview{name: "Employee 2", rating: 3}
      ],
      overall_rating: 3,
      ratings: %DealerReviews.Review.Ratings{
        customer_service: 4,
        friendliness: 4,
        overall: 4,
        pricing: 4,
        quality: 4,
        recommend: true
      },
      title: "Title",
      visit_reason: "reason"
    }
    """

    actual = capture_io(fn -> DealerReviews.Cli.print_review(@review_fixture) end)
    assert actual == expected
  end
end
