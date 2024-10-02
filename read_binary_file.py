with open('ex1/work', 'rb') as bfile:
    # This prints each byte one after the other
    #binary_content = bfile.read()
    #print(binary_content)

    # This prints each byte in hex format one the other
    #binary_content = bfile.read()
    #hex_content = ['{:02x}'.format(byte) for byte in binary_content]
    #print(' '.join(hex_content))

    # This prints the bytes in chunks of specified size
    chunk_size = 30
    binary_content = bfile.read()
    for i in range(0, len(binary_content), chunk_size):
        print(f'{i:08x}: ', end='')

        chunk = binary_content[i:i+chunk_size]

        hex_bytes = ' '.join(f'{byte:02x}' for byte in chunk)
        print(hex_bytes)
