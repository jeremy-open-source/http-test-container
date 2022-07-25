from typing import Dict

from flask import Flask
from html import escape
from os import environ
import socket


app = Flask(__name__)

def dict_to_html_table_rows(items: Dict[str, str]):
    result_list = []
    for key, value in items.items():
        result_list.append(f"""
<tr>
    <td>{escape(key)}</td>
    <td>{escape(value)}</td>
</tr>        
        """)
    return "\n".join(result_list)

def dict_to_simple_table(title: str, items: Dict[str, str]):
    return f"""
<h2>{escape(title)}</h2>
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Value</th>
        </tr>
    <thead>
    <tbody>
        {dict_to_html_table_rows(items)}
    </tbody>
    <tfoot>
        <tr>
            <th>Name</th>
            <th>Value</th>
        </tr>
    </tfoot>
</table>
    """


@app.route("/")
def hello():
    debug = {
        "hostname": socket.gethostname()
    }


    return f"""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Http Test Container</title>
    <style>
       table, td, th {{
            border: 1px solid #999;
            padding: 0.5rem;
            text-align: left;
       }}
       table {{
            border-collapse: collapse;
       }}
    </style>
</head>
<body>
    <h1>Welcome to the http test container</h1>
    {dict_to_simple_table("Debug", debug)}
    {dict_to_simple_table("Environment", dict(environ))}
</body>
</html>
"""

if __name__ == "__main__":
    # For development
    app.run(host='0.0.0.0', port=8080)
