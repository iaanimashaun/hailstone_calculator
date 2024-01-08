
import json
import azure.functions as func
from hailstone_calculator.calculator import calculate_hailstone_sequence

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

    # Calculate Hailstone sequence
    result = calculate_hailstone_sequence(starting_number_int)

    # Return the response to the Azure Function runtime
    return func.HttpResponse(
        body=json.dumps(result),
        mimetype="application/json",
        status_code=200
    )
