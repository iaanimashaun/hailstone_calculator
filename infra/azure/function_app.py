
import json
import azure.functions as func
from hailstone_calculator.calculator import HailstoneCalculator

def main(req: func.HttpRequest) -> func.HttpResponse:
    """
    Azure function handler for calculating Hailstone sequence.

    Parameters:
    - req (func.HttpRequest): HTTP request containing the "starting_number".

    Returns:
    func.HttpResponse: HTTP response containing the calculated information.
    """
    # Extract the starting_number from the HTTP request
    starting_number = int(req.params.get('starting_number'))

    # Create an instance of HailstoneCalculator with the specified starting number
    hailstone_calculator = HailstoneCalculator(starting_number)

    # Calculate the hailstone sequence
    hailstone_calculator.calculate_hailstone_sequence()

    # Prepare the response with calculated information
    response = {
        "textual_summary": hailstone_calculator.generate_textual_summary(),
    }

    # Return the response to the Azure Function runtime
    return func.HttpResponse(
        body=json.dumps(response),
        mimetype="application/json",
        status_code=200
    )
