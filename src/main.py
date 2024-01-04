# type: ignore
from hailstone_calculator.calculator import calculate_hailstone_sequence


def main() -> None:
    """
    Main function to interact with the user
    and display hailstone sequence results.

    Returns:
    - None
    """
    while True:
        starting_number = input("Enter the starting number \
                                for hailstone sequence \
                                (or type 'exit' to quit): ")

        if starting_number.lower() == "exit":
            print("Exiting the program.")
            break
        else:
            starting_number_int = int(starting_number)

        # Calculate and display results
        print("\nOutputs:")
        result = calculate_hailstone_sequence(starting_number_int)
        number_of_steps = result["number_of_steps"]
        list_of_steps = result["list_of_steps"]
        textual_summary = result["textual_summary"]
        print(f"Number of steps: {number_of_steps}")
        print(f"List of steps: {list_of_steps}")
        print("Textual Summary:")
        print(textual_summary)


if __name__ == "__main__":
    main()
