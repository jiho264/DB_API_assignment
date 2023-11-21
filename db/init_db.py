import pandas as pd
import sqlite3


def init_entire_database():
    # SQLite 데이터베이스에 연결
    conn = sqlite3.connect("db/StockManageAPP.sqlite")

    # 커서 생성
    cur = conn.cursor()

    db_init_script = """
    drop table if exists UserInfo;
    drop table if exists StockInfo;
    drop table if exists IndividualStockAcount;

    create table UserInfo(ID text, PW text, Balance int CHECK(Balance >= 0), Deposit int, FavCategory text,
    primary key (ID));

    create table StockInfo(StockCode text, StockName text, Category text, Price int,
    primary key(StockCode));

    create table IndividualStockAcount(ID text, StockCode text, StockName text, Count int, TotalPrice int,
    primary key(ID, StockCode),
    foreign key (ID) references UserInfo(ID),
    foreign key (StockCode) references StockInfo(StockCode)
    );
    """

    # SQL 쿼리 실행
    cur.executescript(db_init_script)
    # 변경사항 커밋
    conn.commit()

    # Read data from Excel file
    excel_file_path = "db/doc/UserInfo.xlsx"  # replace with your file path
    df = pd.read_excel(excel_file_path)

    # Insert the data into the table
    for index, row in df.iterrows():
        cur.execute(
            f"INSERT INTO UserInfo VALUES ({', '.join(['?' for _ in row])})", tuple(row)
        )

    # Commit the changes and close the connection
    conn.commit()

    # Read data from Excel file
    excel_file_path = "db/doc/IndividualStockAcount.xlsx"  # replace with your file path
    df = pd.read_excel(excel_file_path)

    # Insert the data into the table
    for index, row in df.iterrows():
        # Convert the first element of the row to a string and fill with zeros to make it 6 digits
        row[1] = str(row[1]).zfill(6)
        cur.execute(
            f"INSERT INTO IndividualStockAcount VALUES ({', '.join(['?' for _ in row])})",
            tuple(row),
        )

    # Commit the changes and close the connection
    conn.commit()

    conn.close()
