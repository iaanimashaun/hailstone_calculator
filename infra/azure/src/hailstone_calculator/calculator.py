"""
Module for hailstone calculator.
"""


from typing import List


class HailstoneCalculator:
    """
    Class for calculating Hailstone sequence.
    """

    def __init__(self, starting_number: int) -> None:
        """
        Initializes the HailstoneCalculator.

        Parameters:
        - starting_number (int): The starting number
        for the hailstone sequence.
        
        Raises:
        - ValueError: If the starting number is not a positive integer or a valid numeric string.
        """
        if not isinstance(starting_number, (int, str)):
            raise ValueError("Starting number must be a positive integer or a valid numeric string.")
        
        try:
            self.starting_number = int(starting_number)
        except ValueError:
            raise ValueError("Starting number must be a positive integer or a valid numeric string.")
        
        if self.starting_number <= 0:
            raise ValueError("Starting number must be a positive integer.")
        
        self.sequence = [self.starting_number]

    def calculate_hailstone_sequence(self) -> None:
        """
        Calculates the hailstone sequence for the specified starting number.

        Returns:
        - None
        """
        number = self.starting_number
        while number != 1:
            if number % 2 == 0:
                number //= 2
            else:
                number = 3 * number + 1
            self.sequence.append(number)

    def get_number_of_steps(self) -> int:
        """
        Gets the number of steps in the hailstone sequence.

        Returns:
        - int: The number of steps.
        """
        return len(self.sequence) - 1

    def get_steps_list(self) -> List[int]:
        """
        Gets the hailstone sequence as a list.

        Returns:
        - list: The list containing the hailstone sequence.
        """
        return self.sequence

    def generate_textual_summary(self) -> str:
        """
        Generates a textual summary of the hailstone sequence.

        Returns:
        - str: The textual summary.
        """
        summary = f"Hailstone sequence: {', '.join(map(str, self.sequence))}\n"
        summary += f"Number of steps: {self.get_number_of_steps()}\n"
        summary += f"Final number: {self.sequence[-1]}"
        return summary


def calculate_hailstone_sequence(starting_number: int) -> dict:
    """
    Calculates the hailstone sequence for the specified starting number.

    Parameters:
    - starting_number (int): The starting number for the hailstone sequence.

    Returns:
    - dict: A tuple containing the number of steps,
    list of steps, and textual summary.
    """
    hailstone_calculator = HailstoneCalculator(starting_number)
    hailstone_calculator.calculate_hailstone_sequence()

    return {
        "number_of_steps": hailstone_calculator.get_number_of_steps(),
        "list_of_steps": hailstone_calculator.get_steps_list(),
        "textual_summary": hailstone_calculator.generate_textual_summary(),
    }
