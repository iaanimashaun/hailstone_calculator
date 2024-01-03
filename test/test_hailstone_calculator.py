import unittest
from src.hailstone_calculator.calculator import HailstoneCalculator


class TestHailstoneCalculator(unittest.TestCase):
    def test_hailstone_calculator_with_small_number(self):
        """
        Test HailstoneCalculator with a small starting number (5).
        """
        calculator = HailstoneCalculator(5)
        calculator.calculate_hailstone_sequence()

        self.assertEqual(calculator.get_number_of_steps(), 5)
        self.assertEqual(calculator.get_steps_list(), [5, 16, 8, 4, 2, 1])
        self.assertIn(
            "Hailstone sequence: 5, 16, 8, 4, 2, 1",
            calculator.generate_textual_summary(),
        )

    def test_hailstone_calculator_with_large_number(self):
        """
        Test HailstoneCalculator with a larger starting number (12).
        """
        calculator = HailstoneCalculator(12)
        calculator.calculate_hailstone_sequence()

        self.assertEqual(calculator.get_number_of_steps(), 9)
        self.assertEqual(
            calculator.get_steps_list(),
            [12, 6, 3, 10, 5, 16, 8, 4, 2, 1],
        )
        self.assertIn(
            "Hailstone sequence: 12, 6, 3, 10, 5, 16, 8, 4, 2, 1",
            calculator.generate_textual_summary(),
        )


if __name__ == "__main__":
    unittest.main()
