# from flask import Flask, request

# app = Flask(__name__)


# @app.route("/submit", methods=["POST"])
# def submit():
#     userid = request.form.get("userid")
#     pw = request.form.get("pw")
#     stockcode = request.form.get("stockcode")
#     count = request.form.get("count")

#     print(f"User ID: {userid}")
#     print(f"Password: {pw}")
#     print(f"Stock Code: {stockcode}")
#     print(f"Count: {count}")

#     return "Form submitted"


# if __name__ == "__main__":
#     app.run(port=8000, debug=True)

import sqlite3
from flask import Flask, request

app = Flask(__name__)

# Connect to the database
conn = sqlite3.connect("db/StockManageAPP.sqlite")

c = conn.cursor()

# # Create table if not exists
# c.execute(
#     """
#     CREATE TABLE IF NOT EXISTS IndividualStockAccount
#     (ID TEXT, StockCode TEXT, Count INTEGER, PRIMARY KEY(ID, StockCode))
# """
# )


@app.route("/submit", methods=["POST"])
def submit():
    userid = request.form.get("userid")
    stockcode = request.form.get("stockcode")
    count = int(request.form.get("count"))

    # Get the stock name from the StockInfo table
    c.execute(
        """
        SELECT StockName FROM StockInfo WHERE StockCode = ?
    """,
        (stockcode,),
    )
    result = c.fetchone()

    if result is None:
        return "Invalid stock code"

    stockname = result[0]

    # Check if the row exists in the IndividualStockAccount table
    c.execute(
        """
        SELECT Count FROM IndividualStockAccount WHERE ID = ? AND StockCode = ?
    """,
        (userid, stockcode),
    )
    result = c.fetchone()

    if result is not None:
        # If the row exists, update the count
        new_count = result[0] + count
        c.execute(
            """
            UPDATE IndividualStockAccount SET Count = ? WHERE ID = ? AND StockCode = ?
        """,
            (new_count, userid, stockcode),
        )
    else:
        # If the row does not exist, insert a new row
        c.execute(
            """
            INSERT INTO IndividualStockAccount (ID, StockCode, StockName, Count)
            VALUES (?, ?, ?, ?)
        """,
            (userid, stockcode, stockname, count),
        )

    # Commit the transaction
    conn.commit()

    return "Form submitted"


if __name__ == "__main__":
    app.run(port=8000, debug=True)
