
from hailstone_calculator.calculator import calculate_hailstone_sequence

def lambda_handler(event, context):
    """
    Lambda function handler for calculating Hailstone sequence.

    Parameters:
    - event (dict): Input event containing the "starting_number".
    - context: AWS Lambda runtime context.

    Returns:
    dict: Response containing the calculated information:
        - textual_summary (str): Textual summary of the Hailstone sequence.
    """
    # Extract the starting_number from the Lambda event
    starting_number = int(event.get("starting_number"))

    # Calculate Hailstone sequence
    result = calculate_hailstone_sequence(starting_number_int)

   

    # Return the result to the Lambda runtime
    return result
