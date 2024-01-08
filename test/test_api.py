from fastapi.testclient import TestClient
from src.api import app  
import pytest

client = TestClient(app)


def test_hailstone_sequence():
    """
    Test the /hailstone endpoint with various starting numbers.

    Test cases cover positive, negative, and zero.

    """
    test_cases = [
        {"starting_number": 10, "expected_sequence": [10, 5, 16, 8, 4, 2, 1]}, # Test with a positive number
        {"starting_number": 5, "expected_sequence": [5, 16, 8, 4, 2, 1]}, # Test with a positive number
        {"starting_number": 0, "expected_error": ValueError},  # Test with zero (expects ValueError)
        {"starting_number": -3, "expected_error": ValueError},  # Test with a negative number (expects ValueError)
    ]

    # Iterate through test cases
    for test_case in test_cases:
        if 'expected_error' in test_case:
            with pytest.raises(test_case['expected_error']):
                client.get(f"/hailstone?starting_number={test_case['starting_number']}")
        else:
            response = client.get(f"/hailstone?starting_number={test_case['starting_number']}")
            assert response.status_code == 200
            assert response.json()['list_of_steps'] == test_case["expected_sequence"]
