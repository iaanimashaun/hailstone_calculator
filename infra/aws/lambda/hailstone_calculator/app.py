# lambda_function.py

from hailstone_calculator.calculator import HailstoneCalculator

def lambda_handler(event, context):
    """
    Lambda function handler for calculating Hailstone sequence.

    Parameters:
    - event (dict): Input event containing the "starting_number".
    - context: AWS Lambda runtime context (unused in this function).

    Returns:
    dict: Response containing the calculated information:
        - number_of_steps (int): Number of steps taken to reach the end of the sequence.
        - list_of_steps (list): List of integers representing each step in the sequence.
        - textual_summary (str): Textual summary of the Hailstone sequence.
    """
    # Extract the starting_number from the Lambda event
    starting_number = int(event.get("starting_number"))

    # Create an instance of HailstoneCalculator with the specified starting number
    hailstone_calculator = HailstoneCalculator(starting_number)

    # Calculate the hailstone sequence
    hailstone_calculator.calculate_hailstone_sequence()

    # Prepare the response with calculated information
    response = {
        "textual_summary": hailstone_calculator.generate_textual_summary(),
    }

    # Return the response to the Lambda runtime
    return response
