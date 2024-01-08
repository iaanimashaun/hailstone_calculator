import unittest
from src.hailstone_calculator.calculator import HailstoneCalculator

class TestHailstoneCalculator(unittest.TestCase):
    """
    Class for testing HailstoneCalculator.
    """
    def test_hailstone_calculator_with_positive_number(self):
        """
        Test HailstoneCalculator with a positive starting number (5).
        """
        calculator = HailstoneCalculator(5)
        calculator.calculate_hailstone_sequence()

        self.assertEqual(calculator.get_number_of_steps(), 5)
        self.assertEqual(calculator.get_steps_list(), [5, 16, 8, 4, 2, 1])
        self.assertIn(
            "Hailstone sequence: 5, 16, 8, 4, 2, 1",
            calculator.generate_textual_summary(),
        )

    def test_hailstone_calculator_with_negative_number(self):
        """
        Test HailstoneCalculator with a negative starting number (-5).
        """
        with self.assertRaises(ValueError):
            calculator = HailstoneCalculator(-5)

    def test_hailstone_calculator_with_zero(self):
        """
        Test HailstoneCalculator with a starting number of 0.
        """
        with self.assertRaises(ValueError):
            calculator = HailstoneCalculator(0)

    def test_hailstone_calculator_with_string(self):
        """
        Test HailstoneCalculator with a starting number of 0.
        """
        with self.assertRaises(ValueError):
            calculator = HailstoneCalculator("abc")
    
if __name__ == "__main__":
    unittest.main()
