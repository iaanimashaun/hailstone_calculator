# lambda_function.py

from hailstone_calculator.calculator import HailstoneCalculator


def lambda_handler(event, context):
    # Extract the starting_number from the Lambda event
    print("event: ", event)
    starting_number = int(event.get("starting_number"))

    # Create an instance of HailstoneCalculator
    hailstone_calculator = HailstoneCalculator(starting_number)

    # Calculate the hailstone sequence
    hailstone_calculator.calculate_hailstone_sequence()

    # Prepare the response
    response = {
        "number_of_steps": hailstone_calculator.get_number_of_steps(),
        "list_of_steps": hailstone_calculator.get_steps_list(),
        "textual_summary": hailstone_calculator.generate_textual_summary(),
    }

    return response
