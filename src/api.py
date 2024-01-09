"""
API for hailstone calculator.
"""

from fastapi import FastAPI
from src.hailstone_calculator.calculator import calculate_hailstone_sequence

app = FastAPI()



@app.get("/hailstone")
async def hailstone_sequence(starting_number: int):
    """
    Endpoint to calculate the Hailstone sequence.

    Args:
        starting_number (int): The starting number for the Hailstone sequence.

    Returns:
    - dict: A dict containing the number of steps,
    list of steps, and textual summary.
    """
    result = calculate_hailstone_sequence(starting_number)
    return result
