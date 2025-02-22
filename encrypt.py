def xor_encrypt(message: str, key: int):
    """
    Encrypts a message using XOR with a given key.

    Args:
      message: The text to encrypt
      key: The XOR key as an integer

    Return:
      List of encrypted bytes in hexadecimal format
    """
    encrypted = [ord(char) ^ key for char in message]
    hex_output = ", ".join(f"0x{byte:02X}" for byte in encrypted)

    print("\nEncrypted XOR Data:\n")
    print(f".byte {hex_output}\n")
    return encrypted


def main():
    message = input("Enter your message: ")

    try:
        key = int(input("Enter key in hex (e.g., 0x42): "), 16)
    except ValueError:
        print("Invalid key format. Please enter a valid hexadecimal number.")
        return

    append_new_line = (
        input("Append newline at the end? (Y/n): ").strip().lower()
    )
    if append_new_line in ["y", ""]:
        message += "\n"
        print("Appending newline at the end.")

    # Encrypt the message
    xor_encrypt(message, key)


if __name__ == "__main__":
    main()
