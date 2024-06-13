import psycopg2
from jupyterhub.app import main

def check_db_connection():
    try:
        conn = psycopg2.connect(
            dbname="postgres",
            user="postgres",
            password="password",
            host="db",
            port="5432"
        )
        conn.close()
        print("Database connection successful!")
    except Exception as e:
        print("Database connection failed:", e)

if __name__ == "__main__":
    check_db_connection()
    main()