# MySQLServer.py

import mysql.connector
from mysql.connector import errorcode
import getpass  # to hide password input

try:
    # Get username and password securely
    user = input("Enter MySQL username: ")
    password = getpass.getpass("Enter MySQL password: ")

    # Connect to MySQL server
    conn = mysql.connector.connect(
        host="localhost",
        user=user,
        password=password
    )

    cursor = conn.cursor()

    # Create database if it doesn't exist
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

    print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Error: Invalid username or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Error: Database does not exist")
    else:
        print(f"Error: {err}")

finally:
    # Close cursor and connection
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals() and conn.is_connected():
        conn.close()
